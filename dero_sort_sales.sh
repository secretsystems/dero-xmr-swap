#!/bin/bash
echo "Scanning: $txid"
if [ ! -s "$dero_pong_db" ] ; then
	echo "Not a sale..."
fi

if [[ "$already_processed" =~ "$time" ]] ; then 
	echo "Already processed, skipping"
			continue
fi

if [[ "$amount" == "2" ]] ; then 
		
		if [[ "$dst_port" == "1337" ]] ; then
			echo "DST_PORT 1337 activated"
				source ./dero_announce_addr.sh
				timeout 20m bash -c 'source ./monero_scan_wallet.sh'  
				return
		fi
		if [[ "$dst_port" == "7331" ]] ; then
			echo "DST_PORT 7331 activated"
				source ./dero_announce_proceedure.sh
		fi
fi


