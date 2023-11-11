#!/usr/bin/env bash

# Source common functions and environment variables
source common.sh

# Define the ping amount and scid
amnt="2"
scid="0000000000000000000000000000000000000000000000000000000000000000"

# Generate the integrated Monero address and payment ID using a separate script
response=$(source ./app/generate/_integrated_addr_xmr_with_pay_id.sh)

# Extract the integrated Monero address
xmr_addr=$(echo "$response" | jq -r '.integrated_address')

# Extract the integrated Monero payment ID
xmr_payment_id=$(echo "$response" | jq -r '.payment_id')

# Export variables for later use
export xmr_addr xmr_payment_id

# Construct the transfer request payload using jq
payload=$(jq -n --arg addr "$addr" --arg amnt "$amnt" --arg scid "$scid" --arg xmr_addr "$xmr_addr" '{
    "jsonrpc": "2.0",
    "id": "1",
    "method": "transfer",
    "params": {
        "ringsize": 16,
        "transfers":
        [
            {
                "scid": $scid,
                "destination": $addr,
                "amount": ($amnt | tonumber),
                "payload_rpc":
                [
                    {
                        "name": "C",
                        "datatype": "S",
                        "value": "XMR_Addr \($xmr_addr)"
                    }
                ]
            }
        ]
    }
}')

echo "SERVICE MSG: Sending encrypted pong"

# Send the transfer request using cURL
response=$(curl -u $user:$pass -s -X POST -H 'Content-type: application/json' -d "$payload" http://$dero_ip:$dero_port/json_rpc)

# Check if the transfer was successful
txid=$(echo "$response" | jq -r '.result.txid')
if [ -n "$txid" ]; then
    echo "SERVICE MSG: Pong sent | txid $txid"
    printf "sale %s %s %s %s\n" "$time" "$addr" "$amnt" "$txid" >> "$dero_pong_db"
else
    echo "SERVICE MSG: Failed to send pong to ping"
fi
