#!/usr/bin/env bash

# Source common functions and environment variables
source bin/common.sh

echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') tx being delivered"
echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') send DERO to recipient | addr $addr | amount $amnt"

# Construct the transfer request payload
payload=$(jq -n --arg addr "$addr" --arg amnt "$amnt" --arg scid "$scid" \
	'{
	"jsonrpc": "2.0",
	"id": "1",
	"method": "transfer",
	"params": {
	"transfers": [
	{
		"scid": $scid,
		"destination": $addr,
		"amount": ($amnt | tonumber)}
	],
	"ringsize": 16}}')

echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') sending tx over encrypted network"
# Send the transfer request using cURL
# echo $payload
response=$(curl -u $user:$dero_pass -s -X POST -H 'Content-type: application/json' -d "$payload" http://$dero_ip:$dero_port/json_rpc)

# Check if the transfer was successful
txid=$(echo "$response" | jq -r '.result.txid')
echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') tx sent with txid $txid"
printf "sale %s %s %s %s\n" "$time" "$monero_addr" "$amnt" "$txid" | tee >> $monero_pong_db
