#!/bin/bash

    iptables-save > iptables.bkp
    iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 5400
    iptables -t nat -I PREROUTING -p tcp --dport 8080 -j REDIRECT --to-ports 5500
    iptables -t nat -I PREROUTING -p tcp --dport 8880 -j REDIRECT --to-ports 5500
    iptables -t nat -I PREROUTING -p tcp --dport 2052 -j REDIRECT --to-ports 5400
    iptables -t nat -I PREROUTING -p tcp --dport 2082 -j REDIRECT --to-ports 5400
    iptables -t nat -I PREROUTING -p tcp --dport 2086 -j REDIRECT --to-ports 5400
    iptables -t nat -I PREROUTING -p tcp --dport 2095 -j REDIRECT --to-ports 5400
    iptables -t nat -I PREROUTING -p tcp --dport 8280 -j REDIRECT --to-ports 5400
