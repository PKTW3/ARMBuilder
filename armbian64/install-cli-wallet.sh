#!/bin/bash

echo "PKTD INSTALL > downloading dependencies..."
apt-get update && apt-get install -y apt-utils pkg-config file gcc git curl
echo "PKTD INSTALL > preparing to build source from github, this will take time..."
mkdir -p /etc/pktwallet/ && cd /etc/pktwallet/ && git clone https://github.com/pkt-cash/pktd.git && cd pktd && ./do
echo "PKTD INSTALL > complete!"
echo "Your pktd install is in /etc/pktwallet/pktd/"
echo "wallet bin path is : /etc/pktwallet/pktd/bin/pktwallet"
echo "***********************************************"
echo "please initialize your wallet before continuing..."
echo "HINT: ./etc/pktwallet/pktd/bin/pktwallet --create"
echo "see: https://docs.pkt.cash/en/latest/pktd/pktwallet/#creating-a-new-wallet"
echo "***********************************************"


