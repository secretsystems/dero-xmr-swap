echo "tx being delivered"
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
echo $payload
# Send the transfer request using cURL
response=$(curl -u user:pass -s -X POST -H 'Content-type: application/json' -d "$payload" http://$dero_ip:$dero_port/json_rpc)

# Check if the transfer was successful
txid=$(echo "$response" | jq -r '.result.txid')
echo "$txid"
printf "sale %s %s %s %s\n" "$time" "$monero_addr" "$amnt" "$txid" | tee >> $monero_pong_db
