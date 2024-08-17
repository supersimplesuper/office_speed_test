# Bluerock Office speed test script

This is a small script to test the speed of the Bluerock internet connection. It's designed to show that the firewall is interfering with our ability to do day to day work effectively.

## How to run

```bash
make run
```

This will install all dependencies and run the test against the domains in the `domains.txt` file. Please paste your results below in into the `README.md`

## Speed test results

### Sam's home

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