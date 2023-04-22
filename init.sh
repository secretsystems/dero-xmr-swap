#!/bin/bash
date=$(date)
dero_ip="192.168.12.208"
dero_port="10103"
monero_ip="192.168.12.205"
monero_port="28088"

monero_pong_db="monero_pong.db"
touch $monero_pong_db
export monero_pong_db

export dero_ip dero_port monero_ip monero_port monero_pong_db

xmr_dero_addr=$(source ./dero_make_integrated_address_1337.sh)
echo "$xmr_dero_addr" > xmr4dero.addr 
echo "xmr for dero address saved to xmr4dero.addr"
dero_xmr_addr=$(source ./dero_make_integrated_address_7331.sh)
echo "$dero_xmr_addr" > dero4xmr.addr
echo "dero for xmr address saved to dero4xmr.addr"


while true; do
source ./dero_scan_wallet.sh 
done
