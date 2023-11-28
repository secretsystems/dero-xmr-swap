#!/usr/bin/env bash

# Source common functions and environment variables
source bin/common.sh

# Get the PID and export it
timeout_pid=$$
export timeout_pid
echo "SERVICE MSG: Scanning wallet for transfers | pid $timeout_pid "

# Create or update the Monero pong database
touch $monero_pong_db

# Continuous loop
while true; do
    # Process sales data
    source ./app/identify/_xmr_for_dero_trades.sh
    # echo "SERVICE MSG: pid $timeout_pid sleep"
    sleep $seconds
done
