#!/bin/bash

iptables -F

# limit
iptables -I INPUT -m connlimit --connlimit-above 100 -j REJECT
iptables -A INPUT -p icmp -m limit --limit 1/m --limit-burst 10 -j ACCEPT
iptables -A INPUT -p icmp -j DROP

# open ports
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dports 21,22,8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 50000:60000 -j ACCEPT

# enable localhost
iptables -A INPUT -i lo -j ACCEPT

# reject not match pattern
iptables -A INPUT -j REJECT

# show informations
iptables -nL
