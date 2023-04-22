#!/bin/bash
amnt="2"
scid="0000000000000000000000000000000000000000000000000000000000000000"

response=$(source ./monero_make_integrated_address.sh)
# Get the integrated Monero address
xmr_addr=$(echo "$response" | jq -r '.result.integrated_address')

# Get the integrated Monero address
xmr_payment_id=$(echo "$response" | jq -r '.result.payment_id')

export xmr_addr xmr_payment_id

# Construct the transfer request payload
payload=$(jq -n --arg addr "$addr" --arg amnt "$amnt" --arg scid "$scid" --arg xmr_addr "$xmr_addr" '{"jsonrpc": "2.0","id": "1","method": "transfer","params": {"transfers": [{"scid": $scid,"destination": $addr,"amount": ($amnt | tonumber),"payload_rpc": [{"name": "C","datatype": "S","value": "XMR_Addr \($xmr_addr)"}]}],"ringsize": 16}}')

echo "Payload: $payload"

# Send the transfer request using cURL
response=$(curl -u user:pass -s -X POST -H 'Content-type: application/json' -d "$payload" http://$dero_ip:$dero_port/json_rpc)

# Check if the transfer was successful
txid=$(echo "$response" | jq -r '.result.txid')
echo "Transaction being dispatched..."
if [ -n "$txid" ]; then
    echo "Transaction successful: $txid"
printf "sale %s %s %s %s\n" "$time" "$addr" "$amnt" "$txid" | tee -a "$dero_pong_db"
else
    echo "Transaction failed"
fi


