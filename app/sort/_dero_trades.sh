#!/usr/bin/env bash

# Source common functions and environment variables
source common.sh

# Check if the destination port is XMR for DERO port
if [[ "$dst_port" != "$xmr_for_dero_port" ]]; then
    continue
fi

# Check if the transaction has already been processed
if [[ "$already_processed" =~ "$time" ]]; then
    echo "DERO WALLET: tx was already processed, skipping | txid $txid"
    continue
fi

# Check if the destination port is XMR for DERO port and amount is greater than 2
if [[ "$dst_port" == "$xmr_for_dero_port" && "$amount" -gt "2" ]]; then

    echo "DERO WALLET: received DERO send XMR | txid $txid "

    if [[ "$comment" ]]; then

        # Send the request to the Monero daemon's JSON-RPC interface
        response=$(curl -u user:pass --digest --silent --data-binary '{"jsonrpc":"2.0","id":"0","method":"validate_address","params":{"address":"'"$comment"'","any_net_type":true,"allow_openalias":true}}' -H 'content-type: application/json;' http://$monero_ip:$monero_port/json_rpc)

        # Check if the Monero address is valid
        valid=$(echo "$response" | jq -r '.result.valid')

        if [[ "$valid" == "true" ]]; then
            echo "XMR WALLET: monero address is valid"
            addr=$comment
            export addr
            source ./app/convert/_dero_to_xmr.sh
            source ./app/transfer/_xmr.sh
        else
            echo "DERO TXID: $txid found XMR addr invalid: $comment"
        fi
        return
    fi
fi
