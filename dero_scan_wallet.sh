#!/bin/bash

s="18"
echo "SERVICE MSG: sleep is set for $s seconds"

# Initialize Sales List
echo "DERO Wallet: start scanning"
dero_pong_db="dero_pong.db"
touch $dero_pong_db
export dero_pong_db
source ./dero_process_pings.sh
source ./dero_process_trades.sh
echo "DERO WALLET: sleep"
sleep $s


