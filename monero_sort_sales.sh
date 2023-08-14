#!/bin/bash


if [[ "$already_processed" =~ "$time" ]] ; then 
			echo " XMR WALLET: already processed, skipping"
			continue
fi

# Check if pay_id
if [[ "$payment_id" == "$xmr_payment_id" ]]; then
echo "XMR WALLET: $payment_id found at $txid"
    source ./monero_convert_dero.sh
    source ./dero_tx.sh
    return
fi
