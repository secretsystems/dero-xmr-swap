#!/usr/bin/env bash

# Source common functions and environment variables
source bin/common.sh

# Collect quote for USDT-DERO pair from TradeOgre API
get_usdt_dero_quote=$(curl -s -X GET https://tradeogre.com/api/v1/ticker/dero-usdt | jq -r '. | (.bid)')
echo "SERVICE MSG: dero is trading at $get_usdt_dero_quote"

# Calculate USDT value of the transfer amount in DERO
amount_usdt=$(echo "$get_usdt_dero_quote * $amount * 0.00001" | bc -l)
formatted=$(echo "$amount * 0.00001" | bc -l)
echo "SERVICE MSG: the dero amount $formatted is trading for $amount_usdt USDT"

# Get bid for USDT-XMR pair from TradeOgre API
get_usdt_xmr_bid=$(curl -s -X GET https://tradeogre.com/api/v1/ticker/xmr-usdt | jq -r '. | (.bid)')
echo "SERVICE MSG: xmr is trading at $get_usdt_xmr_bid USDT"

# Calculate amount in XMR based on the calculated amount in USDT
amount_xmr=$(bc <<< "scale=12;$amount_usdt / $get_usdt_xmr_bid")
echo "SERVICE MSG: the dero amount $formatted is worth $amount_xmr xmr"

# Calculate a % of XMR as fee
fee_xmr=$(echo "$amount_xmr * 0.01" | bc)
echo "SERVICE MSG: the xmr $amount_xmr fee is $fee_xmr xmr"

# Calculate a % of XMR for the trade after fee deduction
trade_xmr=$(echo "$amount_xmr * 0.99" | bc)
echo "SERVICE MSG: the xmr $amount_xmr to be sent is $trade_xmr"

# Remove decimals and leading zeroes
amnt=$(echo "$trade_xmr" | awk '{ gsub(/^0+|\./,""); print}')

echo "SERVICE MSG: send XMR to recipient | amount $amnt"
