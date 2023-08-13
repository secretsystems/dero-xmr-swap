#!/bin/bash
# we are looking for only the amount of 2
#anything more is basically a trade
if [[ "$already_processed" =~ "$time" ]] ; then 
	echo "DERO TXID: $txid found in db, skipping"
			continue
fi
		
		if [[ "$dst_port" == "1337" ]] ; then
			if [[ "$amount" == "2" ]] ; then 
			echo "DERO TXID: $txid"
			echo "DERO DST_PORT ACTIVATED: 1337"
			echo "SENDING PROCEDURE FOR TRADING XMR FOR DERO"
				source ./dero_announce_addr.sh
				timeout 2m bash -c 'source ./monero_scan_wallet.sh'  &
   				 # Check the exit status of the timeout command (124 indicates timeout)
    				if [ $? -eq 124 ]; then
        			echo "Timeout completed: $timeout_pid"
    				fi
				
				return
			else
				return
		fi
		if [[ "$dst_port" == "7331" ]] ; then
			if [[ "$amount" == "2" ]] ; then 
			echo "DERO TXID: $txid"
			echo "DERO DST_PORT ACTIVATED: 7331"
			echo "SENDING PROCEDURE FOR TRADING DERO FOR XMR"
				source ./dero_announce_proceedure.sh
			elif [[ "$amount" -gt "2" ]] ; then 
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
fi


