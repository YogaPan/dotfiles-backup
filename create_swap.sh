sudo dd if=/dev/zero of=/swapfile bs=1024 count=524288
sudo mkswap /swapfile
sudo swapon /swapfile
grep "swapfile" /etc/fstab || sudo echo "/swapfile none swap sw 0 0" >> /etc/fstab
cat /etc/fstab
swapon -s
free -m
