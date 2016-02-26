#!/bin/sh
#
# Use `sudo crontab -e` and add `@reboot /usr/bin/update-time.sh`
ntpdate -s time.stdtime.gov.tw
