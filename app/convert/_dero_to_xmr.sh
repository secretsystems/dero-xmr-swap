#!/usr/bin/env bash

# Source common functions and environment variables
source common.sh

# Collect quote for USDT-DERO pair from TradeOgre API
get_usdt_dero_quote=$(curl -s -X GET https://tradeogre.com/api/v1/ticker/dero-usdt | jq -r '. | (.bid)')

# Calculate USDT value of the transfer amount in DERO
amount_usdt=$(echo "$get_usdt_dero_quote * $amount * 0.00001" | bc -l)

# Get bid for USDT-XMR pair from TradeOgre API
get_usdt_xmr_bid=$(curl -s -X GET https://tradeogre.com/api/v1/ticker/xmr-usdt | jq -r '. | (.bid)')

# Calculate amount in XMR based on the calculated amount in USDT
amount_xmr=$(bc <<< "scale=12;$amount_usdt / $get_usdt_xmr_bid")

# Calculate a % of XMR as fee
fee_xmr=$(echo "$amount_xmr * 0.01" | bc)

# Calculate a % of XMR for the trade after fee deduction
trade_xmr=$(echo "$amount_xmr * 0.99" | bc)

# Remove decimals and leading zeroes
amnt=$(echo "$trade_xmr" | sed 's/\([0-9]*\.[0-9]\{1,\}\)0*$/\1/;s/\.$//')

echo "SERVICE MSG: send XMR to recipient | amount $amnt"
