#!/usr/bin/env bash

# Source common functions and environment variables
source common.sh

# Export DERO transfers data
dero_export_transfers=$(source ./dero_export_sales.sh)

# Extract relevant information from dero_sales_list
dero_sales_list=$(echo "$dero_export_transfers" | jq -r '.result.entries[] | select(.payload_rpc != null) | (.time) + " " + "unknown" + " " + (.amount | tostring) + " " + (.txid | tostring) + " " + (.dstport | tostring) + " " + (.payload_rpc[] | select(.name == "C" and .datatype == "S") | .value | tostring)')

# Process each sale entry
while read -r sale; do
    time=$(echo $sale | awk '{print $1}')
    addr=$(echo $sale | awk '{print $2}')
    amount=$(echo $sale | awk '{print $3}')
    txid=$(echo $sale | awk '{print $4}')
    dst_port=$(echo $sale | awk '{print $5}')
    comment=$(echo $sale | awk '{print $6}')
    already_processed=$(cat "$monero_pong_db" | grep "$time")
    export time addr amount dst_port already_processed txid comment sale
    
    # Perform sorting and processing of DERO trades
    source ./dero_sort_trades.sh
done <<< "$dero_sales_list"

return
