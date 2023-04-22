#!/bin/bash
curl -s \
-u user:pass --digest \
-X POST http://$monero_ip:$monero_port/json_rpc \
-H 'Content-Type: application/json' \
-d '{
  "jsonrpc":"2.0",
  "id":"0",
  "method":"get_transfers",
  "params":
  {"in":true,
  "account_index":[]
  }
  }' 
