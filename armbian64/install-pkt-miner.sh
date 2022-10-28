#!/bin/bash
echo "PacketcryptRs INSTALL > downloading dependencies..."
apt-get update && apt-get install -y apt-utils pkg-config file gcc git curl make clang-11
sh install-rust.sh
mkdir -p /etc/pktminer/ && cd /etc/pktminer/ && git clone https://github.com/cjdelisle/packetcrypt_rs && cd packetcrypt_rs && CC=clang-11 ~/.cargo/bin/cargo build --release --features jemalloc
echo "PacketcryptRs INSTALL > complete!"
echo "Your miner install is in /etc/pktwallet/packetcrypt_rs/"
