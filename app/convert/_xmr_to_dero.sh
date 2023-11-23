#!/usr/bin/env bash

# Source common functions and environment variables
source common.sh

# Collect quote for USDT-XMR pair from TradeOgre API
get_usdt_xmr_quote=$(curl -s -X GET https://tradeogre.com/api/v1/ticker/xmr-usdt | jq -r '. | (.ask)')
echo "SERVICE MSG: xmr is trading at $get_usdt_xmr_quote"
# Calculate USDT value of the transfer amount in Monero
amount_usdt=$(echo "$get_usdt_xmr_quote * $amount * 0.000000000001" | bc)
echo "SERVICE MSG: the xmr $amount is trading at $amount_usdt"

# Get ask for USDT-DERO pair from TradeOgre API
get_usdt_dero_ask=$(curl -s -X GET https://tradeogre.com/api/v1/ticker/dero-usdt | jq -r '. | (.ask)')
echo "SERVICE MSG: dero is trading at $get_usdt_dero_ask"

# Calculate amount in DERO based on the calculated amount in USDT
amount_dero=$(bc <<< "scale=5;$amount_usdt / $get_usdt_dero_ask")
echo "SERVICE MSG: the xmr $amount is worth at $amount_dero"

# Calculate a % of DERO as fee
fee_dero=$(echo "$amount_dero * 0.01" | bc)
echo "SERVICE MSG: the xmr $amount_dero is worth at $fee_dero"

# Calculate a % of DERO for the trade after fee deduction
trade_dero=$(echo "$amount_dero * 0.99" | bc)

# Remove decimals and leading zeroes
amnt=$(echo "$trade_dero" | awk '{ gsub(/^0+|\./,""); print}')

# Trim leading zeroes
if [[ "$amnt" =~ ^0+([1-9][0-9]*)$ ]]; then
	  amnt=$(expr "$amnt" + 0)
fi

export amnt
