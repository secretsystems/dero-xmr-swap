#!/usr/bin/env bash
source bin/common.sh

# Send a JSON-RPC request to Monero node to generate an integrated address
payload=$(curl -s \
    -u $user:$pass --digest \
    -X POST http://$monero_ip:$monero_port/json_rpc \
    -H 'Content-Type: application/json' \
    -d '{
        "jsonrpc": "2.0",
        "id": "0",
        "method": "make_integrated_address",
        "params": {
            "payment_id": ""
        }
    }'
)

# Extract the payment ID from the response using jq
response=$(echo "$payload" | jq -r '.result')

echo "$response"
