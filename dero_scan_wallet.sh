#!/bin/bash

s="18"
echo "Sleep is set for $s seconds"

# Initialize Sales List
echo "DERO Wallet Scan: start"
dero_pong_db="dero_pong.db"
if [ ! -s "$dero_pong_db" ] ; then
        echo "No data found in DERO for XMR database"
fi
if [ ! -s "$monero_pong_db" ] ; then
       echo "No data found in XMR for DERO database"
fi

touch $dero_pong_db
export dero_pong_db
source ./dero_process_sales.sh
source ./dero_process_trades.sh
echo "DERO Wallet Scan: sleep"
sleep $s


