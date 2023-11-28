#!/bin/bash
source bin/common.sh

curl -s -X POST \
  http://$dero_ip:$dero_port/json_rpc \
  -u $user:$pass \
  -H 'content-type: application/json' \
  -d '{
  "jsonrpc": "2.0",
  "id": "1",
  "method": "GetTransfers",
  "params":
  {
	  "in": true
  }
}'
