#!/bin/bash

sudo iptables -F

# limit
sudo iptables -I INPUT -m connlimit --connlimit-above 100 -j REJECT
sudo iptables -A INPUT -p icmp -m limit --limit 1/m --limit-burst 10 -j ACCEPT
sudo iptables -A INPUT -p icmp -j DROP

# open ports
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp -m multiport --dports 21,22,8080 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 50000:60000 -j ACCEPT

# enable localhost
sudo iptables -A INPUT -i lo -j ACCEPT

# reject not match pattern
sudo iptables -A INPUT -j REJECT

# show informations
sudo iptables -nL
