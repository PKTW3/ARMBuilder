#!/bin/bash
apt-get update
apt-get install -y wget apt-utils pkg-config file gcc git curl
curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
apt-get install -y nodejs gcc g++ make
echo "NODEJS install complete > please wait.."
wget https://go.dev/dl/go1.19.2.linux-arm64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.2.linux-arm64.tar.gz
echo "PATH=/usr/local/go/bin:$PATH" >> /etc/profile
export PATH=$PATH:/usr/local/go/bin
echo "GO INSTALL COMPLETE> system will restart in 10 seconds, ctrl+c to interrupt"
sleep 10
reboot