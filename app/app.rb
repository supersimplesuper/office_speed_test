require 'tabulo'
require 'uri'
require 'resolv'
require 'benchmark'
require 'httpx'
require 'net/http'

def safe_dns_resolve(host)
  Resolv::DNS.open(nameserver: ['8.8.8.8']) do |dns|
    dns.getaddress(host).to_s
  end
rescue => e
  puts "DNS resolution failed: #{e.message}"
  nil
end

def measure_url_performance(url)
  uri = URI.parse(url)
  results = { url: url, dns_times: [], connect_times: [], request_times: [] }

  puts "# Analysing #{url}"

  10.times do
    dns_time = Benchmark.measure do
      results[:ip_address] = safe_dns_resolve(uri.host)
    end
    results[:dns_times] << dns_time.real * 1000

    if results[:ip_address]
      begin
        connect_time = Benchmark.measure do
          socket = Net::HTTP.new(uri.host, uri.port)
          socket.use_ssl = (uri.scheme == 'https')
          socket.start
        end
        results[:connect_times] << connect_time.real * 1000

        request_time = Benchmark.measure do
          response = HTTPX.get(url, 
            headers: {'Cache-Control' => 'no-cache'},
            ssl: { verify_mode: OpenSSL::SSL::VERIFY_PEER }
          )
          response.raise_for_status
        end
        results[:request_times] << request_time.real * 1000
        results[:status] = 'Success'
      rescue HTTPX::Error => e
        results[:status] = "HTTP Error: #{e.message}"
        break
      rescue => e
        results[:status] = "Error: #{e.message}"
        break
      end
    else
      results[:status] = 'DNS Resolution Failed'
      break
    end
  end

  results[:dns_time_avg] = results[:dns_times].sum / results[:dns_times].size
  results[:connect_time_avg] = results[:connect_times].sum / results[:connect_times].size
  results[:request_time_avg] = results[:request_times].sum / results[:request_times].size

  results
end

results = []

File.open("domains.txt", "r").each_line do |row|
  url = row.strip
  results << measure_url_performance(url)
end

# Print results in a table
table = Tabulo::Table.new(results) do |t|
  t.add_column("URL") { |row| row[:url] }
  t.add_column("Avg DNS Time (ms)") { |row| row[:dns_time_avg].round(2) }
  t.add_column("Avg Connect Time (ms)") { |row| row[:connect_time_avg].round(2) }
  t.add_column("Avg Request Time (ms)") { |row| row[:request_time_avg]&.round(2) }
  t.add_column("Status") { |row| row[:status] }
end

puts table.pack(max_table_width: 120)