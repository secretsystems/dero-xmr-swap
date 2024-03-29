#!/usr/bin/env bash

source bin/common.sh

curl -s \
-u $user:$monero_pass --digest \
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
