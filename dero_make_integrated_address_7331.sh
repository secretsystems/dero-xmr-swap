curl -s -X POST \
  http://$dero_ip:$dero_port/json_rpc \
  -H 'content-type: application/json' \
  -u user:pass \
  -d '{
    "jsonrpc": "2.0",
    "id": "1",
    "method": "MakeIntegratedAddress",
    "params": {
    "payload_rpc": [
        {
                "name": "C",
                "datatype": "S",
                "value": "You are trading DERO for XMR :: Complete tx for trade instructs to be delivered to your wallet"
        },
        {
                "name": "D",
                "datatype": "U",
		"value": 7331
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
}' | jq -r '.result  | (.integrated_address)'
