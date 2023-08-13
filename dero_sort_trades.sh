#!/bin/bash

if [[ "$dst_port" != "7331" ]] ; then
	continue

fi

if [[ "$already_processed" =~ "$time" ]] ; then 
	echo "DERO TXID: $txid found in XMR for DERO db, skipping"
			continue
fi

if [[ "$dst_port" == "7331" ]] ; then

		if [[ "$comment" ]] ; then		
	
			# Send the request to the Monero daemon's JSON-RPC interface
			response=$(curl -u user:pass --digest --silent --data-binary '{"jsonrpc":"2.0","id":"0","method":"validate_address","params":{"address":"'"$comment"'","any_net_type":true,"allow_openalias":true}}' -H 'content-type: application/json;' http://$monero_ip:$monero_port/json_rpc)

					# Check if the Monero address is valid
					valid=$(echo "$response" | jq -r '.result.valid')

					if [[ "$valid" == "true" ]]; then
						echo "DERO TXID: $txid scanning"
						echo "Monero address is valid"
						addr=$comment
						export addr
						source ./dero_convert_monero.sh
						source ./monero_tx.sh
					else
						echo "DERO TXID: $txid found XMR addr invalid: $comment"
					fi
			return
		fi
fi



