#!/usr/bin/env bash

source bin/common.sh

# Fetch ticker data for USDT-DERO and USDT-XMR trading pairs from TradeOgre API
a=$(curl -s -X GET https://tradeogre.com/api/v1/ticker/usdt-dero | jq -r '.ask')
b=$(curl -s -X GET https://tradeogre.com/api/v1/ticker/usdt-xmr | jq -r '.ask')

# Calculate exchange rate between USDT-DERO and USDT-XMR
c=$(echo "$a/$b" | bc -l)

# Print ticker data and rounded exchange rate
printf "%.5f\n" $c
# echo "$d"
