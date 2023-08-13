#!/bin/bash


if [[ "$already_processed" =~ "$time" ]] ; then 
	echo "DERO TXID: $txid found in DERO for XMR db, skipping"
			continue
fi

if [[ "$amount" == "2" ]] ; then 
		
		if [[ "$dst_port" == "1337" ]] ; then
			echo "DERO TXID: $txid scanning"
			echo "DERO DST_PORT ACTIVATED: 1337"
			echo "SENDING PROCEDURE FOR TRADING XMR FOR DERO"
			echo "XMR WALLET SCAN: INITIATED"
				source ./dero_announce_addr.sh
				timeout 20m bash -c 'source ./monero_scan_wallet.sh'  &
				timeout_pid=$!
				# Wait for the timeout command to complete (or timeout)
   				 wait $timeout_pid

   				 # Check the exit status of the timeout command (124 indicates timeout)
    				if [ $? -eq 124 ]; then
        			echo "Timeout completed: $timeout_pid"
    				fi
				
				return
		fi
		if [[ "$dst_port" == "7331" ]] ; then
			echo "DERO TXID: $txid scanning"
			echo "DERO DST_PORT ACTIVATED: 7331"
			echo "SENDING PROCEDURE FOR TRADING DERO FOR XMR"
				source ./dero_announce_proceedure.sh
		fi
fi


