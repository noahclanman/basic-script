#!/bin/bash

# Creating server.conf, ca.crt, server.crt and server.key
cat <<'EOFvpnssl' > /etc/openvpn/server/server_tcp_ovpnssl.conf
# Shinu Script

port 5300
dev tun
proto tcp
ca /etc/openvpn/shinu_ssl_ca.crt
cert /etc/openvpn/shinu_ssl_cert.crt
key /etc/openvpn/shinu_ssl_key.key
dh none
persist-tun
persist-key
persist-remote-ip
cipher none
ncp-disable
auth none
comp-lzo
tun-mtu 1500
reneg-sec 0
plugin /etc/openvpn/openvpn-auth-pam.so /etc/pam.d/login
verify-client-cert none
username-as-common-name
max-clients 4000
topology subnet
server 172.16.0.0 255.255.0.0
push "redirect-gateway def1"
keepalive 5 60
status /etc/openvpn/tcp_stats.log
log /etc/openvpn/tcp.log
verb 2
script-security 2
socket-flags TCP_NODELAY
push "socket-flags TCP_NODELAY"
push "dhcp-option DNS 1.0.0.1"
push "dhcp-option DNS 1.1.1.1"
push "dhcp-option DNS 8.8.4.4"
push "dhcp-option DNS 8.8.8.8"
duplicate-cn
EOFvpnssl

# Creating ca.crt
cat <<'EOFCa' > /etc/openvpn/shinu_ssl_ca.crt
-----BEGIN CERTIFICATE-----
MIID0jCCAzugAwIBAgIJALnVZsGmA5VVMA0GCSqGSIb3DQEBCwUAMIGeMQswCQYD
VQQGEwJQSDEOMAwGA1UECAwFQklLT0wxDTALBgNVBAcMBE5hZ2ExFDASBgNVBAoM
C1NjcmlwdEJhcnRzMSQwIgYDVQQLDBtodHRwczovL2dpdGh1Yi5jb20vQmFydHMt
MjMxETAPBgNVBAMMCElBTUJBUlRYMSEwHwYJKoZIhvcNAQkBFhJpYW1iYXJ0eEBn
bWFpbC5jb20wHhcNMjAwODE5MTUzNDM3WhcNNDgwMTA0MTUzNDM3WjCBnjELMAkG
A1UEBhMCUEgxDjAMBgNVBAgMBUJJS09MMQ0wCwYDVQQHDAROYWdhMRQwEgYDVQQK
DAtTY3JpcHRCYXJ0czEkMCIGA1UECwwbaHR0cHM6Ly9naXRodWIuY29tL0JhcnRz
LTIzMREwDwYDVQQDDAhJQU1CQVJUWDEhMB8GCSqGSIb3DQEJARYSaWFtYmFydHhA
Z21haWwuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDbIUbQYcSduz0B
HdaLDGUxByjbdS7R8RQBUmsGbdhZFDSAsqlesgDPfkWO3lUHlUxVf5z3S/aJIvpk
dUeG80p0bHgqJBbkaJWdZzlqS47WPr5N9mkzx7ZxOel5zLTsXGL316SbqKuSXP9K
8FysbxNUOqQw+0PcRR9qRGWFU/d1jQIDAQABo4IBFDCCARAwHQYDVR0OBBYEFKfS
tTje+kKpL1hc2Dt2RaV1yeklMIHTBgNVHSMEgcswgciAFKfStTje+kKpL1hc2Dt2
RaV1yekloYGkpIGhMIGeMQswCQYDVQQGEwJQSDEOMAwGA1UECAwFQklLT0wxDTAL
BgNVBAcMBE5hZ2ExFDASBgNVBAoMC1NjcmlwdEJhcnRzMSQwIgYDVQQLDBtodHRw
czovL2dpdGh1Yi5jb20vQmFydHMtMjMxETAPBgNVBAMMCElBTUJBUlRYMSEwHwYJ
KoZIhvcNAQkBFhJpYW1iYXJ0eEBnbWFpbC5jb22CCQC51WbBpgOVVTAMBgNVHRME
BTADAQH/MAsGA1UdDwQEAwIBBjANBgkqhkiG9w0BAQsFAAOBgQBwdEQ1WxL+CFnu
TXpxBDxCAdVt0wx/BajZoUTFQNx+ayLvbMZG/u39blTYlZZ/Q2VRFw6wa+VRviDk
qLaAs4jTq/IhomRM5eEZRvcCx7sgs5zu3ggD6HFZqrlrTS7XKxBgASkuJtT/DiT8
u37RrsJDD4VPMq8d+Jc0HqPwdatkKg==
-----END CERTIFICATE-----
EOFCa

# Creating cert.crt
cat <<'EOFCert' > /etc/openvpn/shinu_ssl_cert.crt
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            77:4a:a5:72:b1:bf:cb:e3:9e:77:75:7d:02:96:eb:e3
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=PH, ST=BIKOL, L=Naga, O=ScriptBarts, OU=https://github.com/Barts-23, CN=IAMBARTX/emailAddress=iambartx@gmail.com
        Validity
            Not Before: Aug 19 15:34:54 2020 GMT
            Not After : Jan  4 15:34:54 2048 GMT
        Subject: C=PH, ST=BIKOL, L=Naga, O=ScriptBarts, OU=https://github.com/Barts-23, CN=server/emailAddress=iambartx@gmail.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (1024 bit)
                Modulus:
                    00:a7:b4:a7:d4:25:46:3d:0c:f0:55:9b:32:cb:8b:
                    92:e2:d6:d4:d8:09:c2:60:14:30:1b:27:95:76:87:
                    4e:9e:3e:b1:0c:c9:98:02:77:a1:ec:e8:c3:92:6d:
                    b4:e9:86:19:76:35:71:7d:2b:91:70:c0:9b:f3:b7:
                    30:1a:53:12:e0:d8:5e:7b:0c:65:f0:60:36:22:d3:
                    9e:49:ff:2a:74:04:33:ba:f7:a2:98:02:f4:1f:2c:
                    32:d3:c1:be:af:f1:8a:8b:72:fb:7e:8f:4d:73:30:
                    d3:3b:d3:79:77:14:96:37:e4:45:82:6f:a3:3a:05:
                    a1:db:78:13:d5:f0:31:51:89
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Basic Constraints: 
                CA:FALSE
            X509v3 Subject Key Identifier: 
                9C:3B:FA:35:9F:A8:21:33:97:83:2F:E4:82:85:39:7E:B6:36:8B:72
            X509v3 Authority Key Identifier: 
                keyid:A7:D2:B5:38:DE:FA:42:A9:2F:58:5C:D8:3B:76:45:A5:75:C9:E9:25
                DirName:/C=PH/ST=BIKOL/L=Naga/O=ScriptBarts/OU=https://github.com/Barts-23/CN=IAMBARTX/emailAddress=iambartx@gmail.com
                serial:B9:D5:66:C1:A6:03:95:55

            X509v3 Extended Key Usage: 
                TLS Web Server Authentication
            X509v3 Key Usage: 
                Digital Signature, Key Encipherment
            X509v3 Subject Alternative Name: 
                DNS:server
    Signature Algorithm: sha256WithRSAEncryption
         12:ba:a0:bc:95:0f:29:95:84:48:7c:01:ee:04:e1:8c:57:1b:
         08:8d:08:0e:cd:14:f0:5a:50:59:13:f9:04:64:d0:37:96:b0:
         1d:b7:7f:62:2f:03:78:12:1a:ec:93:bd:9c:0b:15:b8:71:c7:
         2d:75:50:56:3f:13:94:22:0a:e3:de:e3:a1:1e:33:49:e4:76:
         d6:91:ad:e7:10:72:80:c8:38:67:70:90:cb:b7:21:49:32:a3:
         fc:95:ef:d7:0d:97:87:cc:40:72:d5:42:1f:d9:9c:a7:ba:8b:
         5e:f9:69:4f:3d:c6:da:6c:e1:8d:96:cc:ad:66:50:f3:5c:db:
         74:fd
-----BEGIN CERTIFICATE-----
MIID/DCCA2WgAwIBAgIQd0qlcrG/y+Oed3V9Apbr4zANBgkqhkiG9w0BAQsFADCB
njELMAkGA1UEBhMCUEgxDjAMBgNVBAgMBUJJS09MMQ0wCwYDVQQHDAROYWdhMRQw
EgYDVQQKDAtTY3JpcHRCYXJ0czEkMCIGA1UECwwbaHR0cHM6Ly9naXRodWIuY29t
L0JhcnRzLTIzMREwDwYDVQQDDAhJQU1CQVJUWDEhMB8GCSqGSIb3DQEJARYSaWFt
YmFydHhAZ21haWwuY29tMB4XDTIwMDgxOTE1MzQ1NFoXDTQ4MDEwNDE1MzQ1NFow
gZwxCzAJBgNVBAYTAlBIMQ4wDAYDVQQIDAVCSUtPTDENMAsGA1UEBwwETmFnYTEU
MBIGA1UECgwLU2NyaXB0QmFydHMxJDAiBgNVBAsMG2h0dHBzOi8vZ2l0aHViLmNv
bS9CYXJ0cy0yMzEPMA0GA1UEAwwGc2VydmVyMSEwHwYJKoZIhvcNAQkBFhJpYW1i
YXJ0eEBnbWFpbC5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAKe0p9Ql
Rj0M8FWbMsuLkuLW1NgJwmAUMBsnlXaHTp4+sQzJmAJ3oezow5JttOmGGXY1cX0r
kXDAm/O3MBpTEuDYXnsMZfBgNiLTnkn/KnQEM7r3opgC9B8sMtPBvq/xioty+36P
TXMw0zvTeXcUljfkRYJvozoFodt4E9XwMVGJAgMBAAGjggE5MIIBNTAJBgNVHRME
AjAAMB0GA1UdDgQWBBScO/o1n6ghM5eDL+SChTl+tjaLcjCB0wYDVR0jBIHLMIHI
gBSn0rU43vpCqS9YXNg7dkWldcnpJaGBpKSBoTCBnjELMAkGA1UEBhMCUEgxDjAM
BgNVBAgMBUJJS09MMQ0wCwYDVQQHDAROYWdhMRQwEgYDVQQKDAtTY3JpcHRCYXJ0
czEkMCIGA1UECwwbaHR0cHM6Ly9naXRodWIuY29tL0JhcnRzLTIzMREwDwYDVQQD
DAhJQU1CQVJUWDEhMB8GCSqGSIb3DQEJARYSaWFtYmFydHhAZ21haWwuY29tggkA
udVmwaYDlVUwEwYDVR0lBAwwCgYIKwYBBQUHAwEwCwYDVR0PBAQDAgWgMBEGA1Ud
EQQKMAiCBnNlcnZlcjANBgkqhkiG9w0BAQsFAAOBgQASuqC8lQ8plYRIfAHuBOGM
VxsIjQgOzRTwWlBZE/kEZNA3lrAdt39iLwN4Ehrsk72cCxW4ccctdVBWPxOUIgrj
3uOhHjNJ5HbWka3nEHKAyDhncJDLtyFJMqP8le/XDZeHzEBy1UIf2Zynuote+WlP
PcbabOGNlsytZlDzXNt0/Q==
-----END CERTIFICATE-----
EOFCert

# Creating key.key
cat <<'EOFKey' > /etc/openvpn/shinu_ssl_key.key
-----BEGIN PRIVATE KEY-----
MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAKe0p9QlRj0M8FWb
MsuLkuLW1NgJwmAUMBsnlXaHTp4+sQzJmAJ3oezow5JttOmGGXY1cX0rkXDAm/O3
MBpTEuDYXnsMZfBgNiLTnkn/KnQEM7r3opgC9B8sMtPBvq/xioty+36PTXMw0zvT
eXcUljfkRYJvozoFodt4E9XwMVGJAgMBAAECgYBiMSBi0kBB1qWROgGPs/UY4/hT
VcN9RdS00YRtleOuO76mYhKivzEL6W04+wsGAAJAeCIuy6eogN3O4N9FSoauNNq+
Om95WGLY+OWE9H61Y+UioafqMRN6CFiSvy1a0inOclunBljcf68uZIkeKgTPoc0v
osNfuCas7LfO48XPkQJBANFoKHsAqdYvbF+/RZqVfd5sqXMUPNCww9YeQsGz3mBp
yp+Tx7T+wGUKGKZzD9fqwN2+z0kP1QYtkCSF4pRL4ZMCQQDNBTFc0AWBietYonsN
ewllx+D72k5Tt2TdSBOhYsoZFu28ybkiagGLDBsQsAdpsjSc7HiaBsuiyLjS16kK
eOHzAkEAmnLZUIeXvFrz8tavbqmN0YyRmkg15rJJbtaY5CdXAANnKDWmGU+/9YXx
0mqRJ+6EW8jNOBUOSGU4qEd7a2dgMwJABUyjEAEYg1arTKk2gQyzG3xlJl1oNOXC
p62bREqnaqqbDowwSuFulMeFU5MZPfQrQ/sgyupuDREfJeQJLIofXQJBAKpVRR0G
JFriv/ukvYSEiw4bgneXbKtTjvXVE5B518RSPaaLEdz7agCJZ3yGWt8Hw3L1GEHE
1Z9t3f/rftuj+4U=
-----END PRIVATE KEY-----
EOFKey

# Starting OpenVPN Server
systemctl start openvpn@server_tcp_ovpnssl
systemctl enable openvpn@server_tcp_ovpnssl
systemctl restart openvpn@server_tcp_ovpnssl

