require 'tabulo'
require 'uri'
require 'resolv'
require 'benchmark'
require 'httpx'

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
  result = { url: url }

  puts "# Analysing #{url}"

  dns_time = Benchmark.measure do
    result[:ip_address] = safe_dns_resolve(uri.host)
  end

  result[:dns_time] = dns_time.real * 1000

  if result[:ip_address]
    begin
      request_time = Benchmark.measure do
        response = HTTPX.get(url, 
          headers: {'Cache-Control' => 'no-cache'},
          ssl: { verify_mode: OpenSSL::SSL::VERIFY_PEER }
        )
        response.raise_for_status
      end
      result[:request_time] = request_time.real * 1000
      result[:status] = 'Success'
    rescue HTTPX::Error => e
      result[:status] = "HTTP Error: #{e.message}"
    rescue => e
      result[:status] = "Error: #{e.message}"
    end
  else
    result[:status] = 'DNS Resolution Failed'
  end

  result
end

results = []

File.open("domains.txt", "r").each_line do |row|
  url = row.strip
  results << measure_url_performance(url)
end

# Print results in a table
table = Tabulo::Table.new(results) do |t|
  t.add_column("URL") { |row| row[:url] }
  t.add_column("DNS Time (ms)") { |row| row[:dns_time].round(2) }
  t.add_column("Request Time (ms)") { |row| row[:request_time]&.round(2) }
  t.add_column("Status") { |row| row[:status] }
end

puts table.pack(max_table_width: 120)
