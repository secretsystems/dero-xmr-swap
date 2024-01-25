#!/usr/bin/env bash

# Source common functions and environment variables
source bin/common.sh

#echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') scanning"

# Create or update DERO pong database
touch $dero_pong_db

# Process ping data
source ./app/identify/_pings.sh

# Process trade data
source ./app/identify/_dero_for_xmr_trades.sh

# Wait for the specified duration
#echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') sleep"
sleep $seconds
