#!/usr/bin/env bash

# Source common functions and environment variables
source bin/common.sh

# Construct the transfer request payload using jq
payload=$(jq -n --arg addr "$addr" --arg ping "$ping" --arg scid "$scid" --arg dero_address "$dero_address" '{
    "jsonrpc": "2.0",
    "id": "1",
    "method": "transfer",
    "params": {
        "transfers": [
            {
                "scid": $scid,
                "destination": $addr,
                "amount": ($ping | tonumber),
                "payload_rpc": [
                    {
                        "name": "C",
                        "datatype": "S",
                        "value": "Send DERO for XMR:\($dero_address)|port 7331|comment: XMR addr"
                    }
                ]
            }
        ],
        "ringsize": 16
    }
}')

echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') Sending encrypted pong"

# Send the transfer request using cURL
response=$(
    curl \
    -u $user:$dero_pass \
    -s \
    -X POST \
    -H 'Content-type: application/json' \
    -d "$payload" \
    http://$dero_ip:$dero_port/json_rpc)

# Check if the transfer was successful
txid=$(echo "$response" | jq -r '.result.txid')
if [ -n "$txid" ]; then
    echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') Sent pong | txid $txid"
    printf "sale %s %s %s %s\n" "$time" "$addr" "$ping" "$txid" >> "$dero_pong_db"
else
    echo "PAYLOAD STATUS: FAILED"
fi
