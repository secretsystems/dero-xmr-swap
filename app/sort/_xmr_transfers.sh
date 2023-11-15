#!/usr/bin/env bash

# Source common functions and environment variables
source common.sh

# Check if the transaction has already been processed
if [[ "$already_processed" =~ "$time" ]]; then
    # echo "SERVICE MSG: already processed, skipping"
    continue
fi

# Check if the payment ID matches
if [[ "$payment_id" == "$xmr_payment_id" ]]; then
    echo "SERVICE MSG: $payment_id found at $txid"
    source ./app/convert/_xmr_to_dero.sh
    source ./app/transfer/_dero.sh
    return
fi
