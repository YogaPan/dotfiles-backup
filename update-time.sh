#!/bin/sh
#
# Use `sudo crontab -e` and add `@reboot /usr/bin/update-time.sh`
sudo ntpdate -s time.stdtime.gov.tw
date
