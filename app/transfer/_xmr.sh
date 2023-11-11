#!/usr/bin/env bash

# Source common functions and environment variables
source common.sh

echo " XMR WALLET: tx being delivered"

# Construct the transfer request payload
payload=$(jq -n --arg addr "$addr" --arg amnt "$amnt" \
    '{ "jsonrpc": "2.0", "id": "0", "method": "transfer", "params": {
        "destinations": [{ "address": $addr, "amount": $amnt }],
        "account_index": 0,
        "subaddr_indices": [0],
        "priority": 0,
        "ring_size": 7,
        "get_tx_key": true
    }}')

# Send the transfer request using cURL
response=$(curl -u $user:$pass --digest -s -X POST -H 'Content-type: application/json' -d "$payload" http://$monero_ip:$monero_port/json_rpc)

# Check if the transfer was successful
txid=$(echo "$response" | jq -r '.result.tx_hash')
if [[ "$txid" != "null" ]]; then
    echo " XMR WALLET: trade complete, writing to db | txid $txid"
    printf "sale %s %s %s %s\n" "$time" "$addr" "$amnt" "$txid" | tee >> $monero_pong_db
else
    echo " XMR WALLET: Transfer failed"
    failed=$(echo "$response" | jq -r '.error.message')
    echo " XMR WALLET: $failed"
    echo " XMR WALLET: will try again until successful"
fi
