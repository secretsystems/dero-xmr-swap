#!/bin/bash


echo "Scanning: $txid"
if [[ "$already_processed" =~ "$time" ]] ; then 
			echo "Already processed, skipping"
			continue
fi

# Check if pay_id
if [[ "$payment_id" == "$xmr_payment_id" ]]; then
    source ./monero_convert_dero.sh
    source ./dero_tx.sh
    return
fi
