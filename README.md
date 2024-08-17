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
+------------------------------+---------------+-------------------+---------+
|              URL             | DNS Time (ms) | Request Time (ms) |  Status |
+------------------------------+---------------+-------------------+---------+
| https://www.xonboard.com.au  |         91.46 |            371.33 | Success |
| https://superapi.com.au      |          21.3 |            475.24 | Success |
| https://www.ct.com.au/       |          33.4 |            273.64 | Success |
| https://www.bluerock.com.au/ |         18.95 |            131.61 | Success |
| https://aws.amazon.com/      |           3.7 |            377.71 | Success |
| https://www.fwps.vic.edu.au/ |         10.38 |            681.48 | Success |
+------------------------------+---------------+-------------------+---------+
```