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
| https://www.xonboard.com.au  |            146.39 |               3078.18 |               3156.02 | Success |
| https://superapi.com.au      |             26.57 |               3079.15 |               3112.19 | Success |
| https://www.ct.com.au/       |             36.87 |                 45.12 |                194.23 | Success |
| https://www.bluerock.com.au/ |             20.34 |                 28.47 |                 19.34 | Success |
| https://aws.amazon.com/      |             17.41 |                3065.4 |               3882.37 | Success |
| https://www.fwps.vic.edu.au/ |           1014.16 |               3081.42 |                434.53 | Success |
+------------------------------+-------------------+-----------------------+-----------------------+---------+
```