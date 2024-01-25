#!/usr/bin/env bash

# Only process transactions with an amount of 2
# Anything more is considered a trade

# Source common functions and environment variables
source bin/common.sh

# Check if the transaction has already been processed
if [[ "$already_processed" =~ "$time" ]]; then
    # echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') tx was already processed, skipping | txid $txid"
    continue
fi

# Check if the transaction amount is 2
if [[ "$amount" == "2" ]]; then
    if [[ "$dst_port" == "$dero_for_xmr_port" ]]; then
        echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') ping received | port 1337 | txid $txid"

        # Deliver pong for ping
        source ./app/pong/_response_dero_for_xmr.sh

        # Turn on XMR wallet scanner
        timeout 60m bash -c 'source ./app/scan/_xmr_wallet.sh' &
        timeout_exit_status=$?

        # Check the exit status of the timeout command (124 indicates timeout)
        if [ "$timeout_exit_status" -eq 124 ]; then
            echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') timeout completed | pid $timeout_pid"
        fi

        return
    fi

    if [[ "$dst_port" == "$xmr_for_dero_port" ]]; then
        echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') ping received | port 7331 | txid $txid"
        source ./app/pong/_response_xmr_for_dero.sh
    fi
fi
