#!/bin/bash

if [[ "$(command -v squid)" ]]; then
 if [[ "$(squid -v | grep -Ec '(V|v)ersion\s3.5.23')" -lt 1 ]]; then
  apt remove --purge squid -y -f 2>/dev/null
  wget "http://security.debian.org/debian-security/pool/updates/main/s/squid3/squid_3.5.23-5+deb9u5_amd64.deb" -qO squid.deb
  dpkg -i squid.deb
  rm -f squid.deb
 else
  echo -e "Squid v3.5.23 already installed"
 fi
else
 if [[ "$(cat /etc/os-release | grep -E 'VERSION_ID=\"9|10|11\"' -c)" -gt 0 ]]; then
  apt install libecap3 squid-common squid-langpack -y -f 2>/dev/null
  wget "http://security.debian.org/debian-security/pool/updates/main/s/squid3/squid_3.5.23-5+deb9u5_amd64.deb" -qO squid.deb
  dpkg -i squid.deb
  rm -f squid.deb
 else
  echo -e "Unsupported Debian version"
 fi
fi

    

