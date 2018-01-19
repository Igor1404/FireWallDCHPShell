#!/bin/bash


iptables -F
iptables -x

echo "1" > proc/sys/net/ipv4/ip-forward


iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -p top --dport 2222 -s ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A FORWARD -r tcp --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp --dport 43 -j ACCEPT
iptables -A FORWARD -p -icmp -j ACCEPT
iptables -A FORWARD -s 192.168.10.10 -d 192.168.10.1 -j ACCEPT
iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE




