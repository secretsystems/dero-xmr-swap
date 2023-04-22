#!/bin/bash

s="18"
echo "Sleep is set for $s seconds"

while true; do
# Get a list of transfers
echo "$date XMR Wallet Scan: start"
monero_pong_db="monero_pong.db"
touch $monero_pong_db
export monero_pong_db
source ./monero_process_sales.sh
echo "XMR Wallet Scan: done"
echo "XMR Wallet Scan: sleep"
sleep $s
done
