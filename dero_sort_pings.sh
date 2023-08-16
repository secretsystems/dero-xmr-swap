#!/bin/bash
# we are looking for only the amount of 2
#anything more is basically a trade
if [[ "$already_processed" =~ "$time" ]] ; then 
	echo "DERO WALLET: tx was already processed, skipping | txid $txid"
			continue
fi

if [[ "$amount" == "2" ]] ; then 
	if [[ "$dst_port" == "1337" ]] ; then
		echo "DERO WALLET: ping received | port 1337 | txid $txid"
			
			# Deliver pong for ping
		source ./dero_announce_addr.sh

		
			# turn on xmr wallet scanner
		timeout 60m bash -c 'source ./monero_scan_wallet.sh'  &
   		timeout_exit_status=$?
			# Check the exit status of the timeout command (124 indicates timeout)
		if [ "$timeout_exit_status" -eq 124 ]; then
        		echo " XMR WALLET: timeout completed | pid $timeout_pid"
		fi
			
		return
	fi

	if [[ "$dst_port" == "7331" ]] ; then
		echo "DERO WALLET: ping received | port 7331 | txid $txid"
		source ./dero_announce_proceedure.sh
	fi
fi
