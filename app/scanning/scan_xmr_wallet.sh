#!/usr/bin/env bash

# Source common functions and environment variables
source common.sh

# Get the PID and export it
timeout_pid=$$
export timeout_pid
echo "XMR WALLET: pid $timeout_pid initiated"

# Create or update the Monero pong database
touch $monero_pong_db

# Continuous loop
while true; do


    # Process sales data
    source ./monero_process_sales.sh
    echo "XMR WALLET: pid $timeout_pid sleep"
    sleep $seconds
done
