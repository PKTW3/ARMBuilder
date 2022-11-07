#!/bin/bash
wget https://go.dev/dl/go1.19.2.linux-arm64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.2.linux-arm64.tar.gz
echo "PATH=/usr/local/go/bin:$PATH" >> /etc/profile
export PATH=$PATH:/usr/local/go/bin
echo "GO INSTALL COMPLETE> please wait.."
sleep 10