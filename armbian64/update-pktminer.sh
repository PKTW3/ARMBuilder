#!/bin/bash
cd /etc/pktwallet/
git pull && CC=clang-11 ~/.cargo/bin/cargo build --release --features jemalloc