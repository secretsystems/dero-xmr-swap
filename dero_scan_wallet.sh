#!/bin/bash

s="18"
echo "Sleep is set for $s seconds"

# data feeds
export_transfers=$(source ./dero_export_sales.sh)

# Initialize Sales List
echo "DERO Wallet Scan: start"
dero_pong_db="dero_pong.db"
touch $dero_pong_db
export dero_pong_db
source ./dero_process_sales.sh
source ./dero_process_trades.sh
echo "DERO Wallet Scan: done"
echo "DERO Wallet Scan: sleep"
sleep $s


