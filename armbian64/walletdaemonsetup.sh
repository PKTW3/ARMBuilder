#!/bin/bash
npm install -g pm2
pm2 start /etc/pktwallet/pktd/bin/pktwallet --name pktwallet
pm2 save
pm2 startup