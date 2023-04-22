#!/bin/bash

# Get a list of transfers
monero_get_transfers=$(source ./monero_export_sales.sh)
monero_sales_list=$(echo $monero_get_transfers | jq -r '.result.in[] | (.timestamp | tostring) + " " + (.address) + " " + (.amount | tostring) + " " + (.txid) + " " + (.payment_id)')

while read -r sale; do
    	time=$(echo $sale | awk '{print $1}')
    	monero_addr=$(echo $sale | awk '{print $2}')
	amount=$(echo $sale | awk '{print $3}')
	txid=$(echo $sale | awk '{print $4}')
    	payment_id=$(echo $sale | awk '{print $5}')
    	already_processed=$(cat "$monero_pong_db" | grep "$time")
	export time monero_addr amount already_processed txid payment_id
    source ./monero_sort_sales.sh
done <<< "$monero_sales_list"
return
