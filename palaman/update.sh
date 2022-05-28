#!/bin/bash

# Creating OpenVPN File
cat <<"OvpnWs" > /var/www/openvpn/WSConfig.ovpn
# OpenVPN Server build vOPENVPN_SERVER_VERSION
# Server Location: OPENVPN_SERVER_LOCATION
# Server ISP: OPENVPN_SERVER_ISP
# 
client
dev tun
persist-tun
proto tcp
remote IP-ADDRESS 110
http-proxy 127.0.0.1 8888
persist-remote-ip
resolv-retry infinite
connect-retry 0 1
remote-cert-tls server
nobind
reneg-sec 0
keysize 0
rcvbuf 0
sndbuf 0
verb 2
comp-lzo
auth none
auth-nocache
cipher none
setenv CLIENT_CERT 0
http-proxy-option VERSION 1.1
auth-user-pass
OvpnWs

echo -e "<ca>\n$(cat /etc/openvpn/ca.crt)\n</ca>" >> /var/www/openvpn/WSConfig.ovpn
