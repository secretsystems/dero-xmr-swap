curl -s -X POST \
  http://$dero_ip:$dero_port/json_rpc \
  -u user:pass \
  -H 'content-type: application/json' \
  -d '{
    "jsonrpc": "2.0",
    "id": "1",
    "method": "MakeIntegratedAddress",
    "params": {
    "payload_rpc": [
        {
                "name": "C",
                "datatype": "S",
                "value": "XMR for DERO trade address"
        },
        {
                "name": "D",
                "datatype": "U",
		 "value": 1337
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
