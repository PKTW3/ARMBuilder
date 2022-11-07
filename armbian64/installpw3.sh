#!/bin/bash

  apt-get install -y libgbm-dev gconf-service libasound2 libatk1.0-0 libatk-bridge2.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget
  mkdir /etc/pktw3
  cd /etc/pktw3
  git clone https://github.com/PKTW3/PktWalletWebWrapper.git
  cd PktWalletWebWrapper
  npm install
  echo "installing pktw3 default configuration.... edit it at /etc/pktw3/config.json ** YOU WILL NEED TO CHANGE PASSWORD (changeme) TO WALLET PASSWORD, QRPASSWORD IS YOUR INITIAL CODE GENERATION PASSWORD"
  echo '{
          "walletstorage":"/root/.pktwallet/pkt/",
          "wallet_password":"changeme",
          "qrpassword":"changeme",
          "walletbinpath":"/etc/pktwallet/pktd/bin",
          "clientWebPath": "/etc/pktw3/PktWalletWebWrapper/client/web",
          "explorerUrl": "https://explorer.pkt.cash",
          "listenport": 80,
          "listenip": "127.0.0.1",
          "unconsolidatedTransationsFold": 200
        }' >> /etc/pktw3/PktWalletWebWrapper/webwallet/config.json
        rm -rf /etc/pktw3/PktWalletWebWrapper/client/web/socketurl.js
        echo 'var socketurl = "http://127.0.0.1";
              var explorerUrl = "https://explorer.pkt.cash";' >> /etc/pktw3/PktWalletWebWrapper/client/web/socketurl.js

        node /etc/pktw3/PktWalletWebWrapper/webwallet/setup/generateauthjson.js

echo "Run armbian64/pw3daemonsetup.sh after editing config.json"
