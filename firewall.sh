#!/bin/bash

sudo iptables -F

# sudo iptables -I INPUT -i lo -j ACCEPT
sudo iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -I INPUT -p icmp -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 21 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 50000:60000 -j ACCEPT
sudo iptables -A INPUT -j REJECT

sudo iptables -nL
