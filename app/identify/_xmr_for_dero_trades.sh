#!/usr/bin/env bash

# Source common functions and environment variables
source bin/common.sh

# Get a list of transfers from Monero
monero_get_transfers=$(source ./app/export/_xmr_transfers.sh)
monero_sales_list=$(echo $monero_get_transfers | jq -r '.result.in[] | (.timestamp | tostring) + " " + (.address) + " " + (.amount | tostring) + " " + (.txid) + " " + (.payment_id)')

# Process each Monero sale entry
while read -r sale; do
    time=$(echo $sale | awk '{print $1}')
    monero_addr=$(echo $sale | awk '{print $2}')
    amount=$(echo $sale | awk '{print $3}')
    txid=$(echo $sale | awk '{print $4}')
    payment_id=$(echo $sale | awk '{print $5}')

   	# We call this the monero_db because they are trading DERO for Monero
	already_processed=$(cat "$monero_pong_db" | grep "$time")

    export time monero_addr amount already_processed txid payment_id

    # Perform sorting and processing of Monero sales
    source ./app/sort/_xmr_transfers.sh
done <<< "$monero_sales_list"

return
