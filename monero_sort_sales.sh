#!/bin/bash


if [[ "$already_processed" =~ "$time" ]] ; then 
			echo "Already processed, skipping"
			continue
fi

# Check if pay_id
if [[ "$payment_id" == "$xmr_payment_id" ]]; then
echo "XMR TXID: $txid scanning"
    source ./monero_convert_dero.sh
    source ./dero_tx.sh
    return
fi
