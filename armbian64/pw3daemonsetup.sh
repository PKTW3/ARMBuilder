#!/bin/bash
cd /etc/pktw3/PktWalletWebWrapper/webwallet
pm2 start main.js --name pktw3
pm2 save
pm2 startup