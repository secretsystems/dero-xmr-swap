#!/usr/bin/env bash

# Source common functions and environment variables
source bin/common.sh

# Prepare payload using jq with environment variables
payload=$(jq -n --arg payload_text "You are trading DERO for XMR :: Complete tx for xmr trade addr to be delivered to your wallet" \
--arg dero_for_xmr_port "$dero_for_xmr_port" '{
    "jsonrpc": "2.0",
    "id": "1",
    "method": "MakeIntegratedAddress",
    "params": {
      "payload_rpc": [
        {
          "name": "C",
          "datatype": "S",
          "value": $payload_text
        },
        {
          "name": "D",
          "datatype": "U",
          "value": ($dero_for_xmr_port | tonumber)
        },
        {
          "name": "N",
          "datatype": "U",
          "value": 0
        },
        {
          "name": "V",
          "datatype": "U",
          "value": 2
        }
      ]
    }
  }')

# Send the payload using cURL and parse the response with jq to extract the integrated address
response=$(curl -s -X POST \
    http://$dero_ip:$dero_port/json_rpc \
    -u $user:$dero_pass \
    -H 'content-type: application/json' \
    -d "$payload" | jq -r '.result.integrated_address')

echo "$response"
