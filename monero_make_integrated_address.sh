IP="127.0.0.1"
PORT=28088
payload=$(curl -s \
    -u user:pass --digest \
    -X POST http://$monero_ip:$monero_port/json_rpc \
    -d '{"jsonrpc":"2.0","id":"0","method":"make_integrated_address","params":{"payment_id": ""}}' \
    -H 'Content-Type: application/json')
echo $payload

