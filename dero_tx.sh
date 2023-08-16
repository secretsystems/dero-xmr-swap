echo "DERO WALLET: tx being delivered"
echo "DERO WALLET: send DERO to recipient | addr $addr | amount $amnt"
 scid="0000000000000000000000000000000000000000000000000000000000000000"
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
echo "DERO WALLET: sending tx over encrypted network"
# Send the transfer request using cURL
# echo $payload
response=$(curl -u user:pass -s -X POST -H 'Content-type: application/json' -d "$payload" http://$dero_ip:$dero_port/json_rpc)

# Check if the transfer was successful
txid=$(echo "$response" | jq -r '.result.txid')
echo "DERO WALLET: tx sent with txid $txid"
printf "sale %s %s %s %s\n" "$time" "$monero_addr" "$amnt" "$txid" | tee >> $monero_pong_db
