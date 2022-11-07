#!/bin/bash
apt-get update
apt-get install -y wget apt-utils pkg-config file gcc git curl
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
apt-get install -y nodejs gcc g++ make
echo "NODEJS install complete"
