#!/usr/bin/env bash

# Source common functions and environment variables
source common.sh

# Display sleep duration
echo "SERVICE MSG: sleep is set for $seconds seconds"

# Initialize Sales List
echo "DERO Wallet: start scanning"

# Create or update DERO pong database
touch $dero_pong_db

# Process ping data
source ./app/identify/_pings.sh

# Process trade data
source ./app/identify/_dero_for_xmr_trades.sh

# Wait for the specified duration
echo "DERO WALLET: sleep"
sleep $seconds
