#!/usr/bin/env bash

# Source common functions and environment variables
source common.sh

# Define the ping amount and scid
amnt="2"
scid="0000000000000000000000000000000000000000000000000000000000000000"

# Construct the transfer request payload using jq
payload=$(jq -n --arg addr "$addr" --arg amnt "$amnt" --arg scid "$scid" --arg xmr_addr "$xmr_addr" '{
    "jsonrpc": "2.0",
    "id": "1",
    "method": "transfer",
    "params": {
        "transfers": [
            {
                "scid": $scid,
                "destination": $addr,
                "amount": ($amnt | tonumber),
                "payload_rpc": [
                    {
                        "name": "C",
                        "datatype": "S",
                        "value": "Send DERO for XMR: dero1qyw4fl3dupcg5qlrcsvcedze507q9u67lxfpu8kgnzp04aq73yheqqg2ctjn4|port 7331|comment: XMR addr"
                    }
                ]
            }
        ],
        "ringsize": 16
    }
}')

echo "SERVICE MSG: Sending encrypted pong"

# Send the transfer request using cURL
response=$(curl -u $user:$pass -s -X POST -H 'Content-type: application/json' -d "$payload" http://$dero_ip:$dero_port/json_rpc)

# Check if the transfer was successful
txid=$(echo "$response" | jq -r '.result.txid')
if [ -n "$txid" ]; then
    echo "SERVICE MSG: Sent pong | txid $txid"
    printf "sale %s %s %s %s\n" "$time" "$addr" "$amnt" "$txid" >> "$dero_pong_db"
else
    echo "PAYLOAD STATUS: FAILED"
fi
