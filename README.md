# Bluerock Office speed test script

This is a small script to test the speed of the Bluerock internet connection. It's designed to show that the firewall is interfering with our ability to do day to day work effectively.

## How to run

```bash
make run
```

This will install all dependencies and run the test against the domains in the `domains.txt` file. Please paste your results below in into the `README.md`

## Speed test results

### Sam home

```
+------------------------------+-------------------+-----------------------+-----------------------+---------+
|              URL             | Avg DNS Time (ms) | Avg Connect Time (ms) | Avg Request Time (ms) |  Status |
+------------------------------+-------------------+-----------------------+-----------------------+---------+
| https://www.xonboard.com.au  |             31.98 |                 54.95 |                233.92 | Success |
| https://superapi.com.au      |              8.45 |                 65.47 |                224.15 | Success |
| https://www.ct.com.au/       |             14.63 |                 53.01 |                192.08 | Success |
| https://www.bluerock.com.au/ |             13.67 |                 26.81 |                 71.09 | Success |
| https://aws.amazon.com/      |             11.39 |                 27.65 |                566.83 | Success |
| https://www.fwps.vic.edu.au/ |              5.65 |                151.22 |                483.65 | Success |
+------------------------------+-------------------+-----------------------+-----------------------+---------+
```

### Sam office

```
+------------------------------+-------------------+-----------------------+-----------------------+---------+
|              URL             | Avg DNS Time (ms) | Avg Connect Time (ms) | Avg Request Time (ms) |  Status |
+------------------------------+-------------------+-----------------------+-----------------------+---------+
| https://www.xonboard.com.au  |             95.45 |               3082.13 |               3211.73 | Success |
| https://superapi.com.au      |            101.18 |               3084.07 |               3182.15 | Success |
| https://www.ct.com.au        |             39.19 |                 61.77 |               3284.66 | Success |
| https://www.bluerock.com.au  |             19.29 |                 35.92 |                 83.59 | Success |
| https://aws.amazon.com       |             21.46 |               3055.12 |               3746.34 | Success |
| https://www.fwps.vic.edu.au  |            130.78 |               3082.56 |                525.08 | Success |
| https://news.ycombinator.com |             19.54 |                573.34 |               1164.46 | Success |
| https://www.shacknews.com    |              20.0 |               3678.98 |               4976.04 | Success |
| https://yahoo.com/           |              4.54 |               3623.66 |                4813.8 | Success |
| https://elixir-lang.org      |            156.21 |               3055.62 |               3310.67 | Success |
| https://richardson.co.nz     |             59.47 |               3223.62 |                594.15 | Success |
+------------------------------+-------------------+-----------------------+-----------------------+---------+
```
