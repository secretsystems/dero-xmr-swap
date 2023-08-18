#!/usr/bin/env bash

# Source common functions and environment variables
source common.sh

# Check if the transaction has already been processed
if [[ "$already_processed" =~ "$time" ]]; then 
    echo "XMR WALLET: already processed, skipping"
    continue
fi

# Check if the payment ID matches
if [[ "$payment_id" == "$xmr_payment_id" ]]; then
    echo "XMR WALLET: $payment_id found at $txid"
    source ./monero_convert_dero.sh
    source ./dero_tx.sh
    return
fi
