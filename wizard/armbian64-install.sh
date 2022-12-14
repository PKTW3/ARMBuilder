echo "*** Welcome to the PKTW3 Auto configuration wizard ***\n"
echo "*** This will guide you through the configuration & Installation of the PKTW3 Web Wallet Wrapper - https://www.pktw3.com/"
echo "\n"
echo "\n"
echo "\**** THE FOLLOWING SOFTWARE(s) AND THEIR DEPENDENCIES WILL BE INSTALLED ****"
echo 'https://github.com/pkt-cash/pktd';
echo "\n"
echo 'https://docs.pkt.cash/en/latest/pktd/pktwallet/';
echo "\n"
echo 'https://github.com/nodesource/distributions';
echo "\n"
echo 'https://pm2.keymetrics.io/';
echo "\n"
echo 'https://github.com/PKTW3/PktWalletWebWrapper';
echo "\n"
echo 'https://go.dev/doc/install';
echo "\n"
echo "\**** Please visit their respective websites for more information"

read -s -n 1 -p "Press any key to continue . . ."

apt-get install -y chromium firefox-esr

if ! [ -x "$(command -v go)" ]; then
  echo 'GO IS NOT INSTALLED, INSTALLING NOW...\n'
  sh ../armbian64/install-go.sh
  export PATH=$PATH:/usr/local/go/bin
fi

if ! [ -x "$(command -v  node)" ]; then
  echo 'NODEJS IS NOT INSTALLED, INSTALLING NOW...\n'
  sh ../armbian64/install-node.sh
fi

if ! [ -x "$(command -v  pm2)" ]; then
  echo 'PM2 IS NOT INSTALLED, INSTALLING NOW... \n'
  npm install -g pm2
fi

if [ ! -d "/etc/pktwallet" ]; then
  echo "PKT CLI WALLET BINARIES NOT FOUND, INSTALLING PKT CLI WALLET, YOU WILL NEED TO CONFIGURE OPTIONS TO PROCEED"
  sh ../armbian64/install-cli-wallet.sh
    echo "** WALLET DIRECT CONFIGURATION... \n"
    echo "** REMEMBER TO WRITE DOWN YOUR SEED AND PASSWORD SOMEWHERE SAFE.. \n"
    read -s -n 1 -p "Press any key to continue . . ."
    sh ../armbian64/walletinit.sh
    #echo "** DAEMONIZING WALLET WITH PM2... \n"
    #sh ../armbian64/walletdaemonsetup.sh
fi

if [ ! -d /etc/pktw3 ]
then
  sh ../armbian64/installpw3.sh
else
    echo "Installation exists at: /etc/pktw3/ if you intend to reinstall rm -rf /etc/pktw3 and re-execute this program."
fi


echo "\****NOW COMPLETE! (after final configuration steps) You can access your wallet at http://127.0.0.1"