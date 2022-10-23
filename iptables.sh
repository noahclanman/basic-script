#!/bin/bash
# apt install iptables-persistent
iptables-save > /etc/iptables/rules.v4.backup
iptables -I INPUT -p tcp --dport 2052 -j ACCEPT
iptables -I INPUT -p tcp --dport 2082 -j ACCEPT
iptables -I INPUT -p tcp --dport 2086 -j ACCEPT
iptables -I INPUT -p tcp --dport 2095 -j ACCEPT
iptables -t nat -I PREROUTING -p tcp --dport 2052 -j REDIRECT --to-ports 80
iptables -t nat -I PREROUTING -p tcp --dport 2082 -j REDIRECT --to-ports 80
iptables -t nat -I PREROUTING -p tcp --dport 2086 -j REDIRECT --to-ports 80
iptables -t nat -I PREROUTING -p tcp --dport 2095 -j REDIRECT --to-ports 80
iptables-save > /etc/iptables/rules.v4

# resolve if after installing slowdns
iptables-save > /etc/iptables/shinu-rules.v4
# extra iptables options if have slowdns
cat <<'LAMISA' > /etc/shinu
LAMISA
