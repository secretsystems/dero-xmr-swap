#!/usr/bin/env bash


# Source common functions and environment variables
source common.sh

# Export DERO transfers data
dero_export_transfers=$(source ./app/export/_dero_transfers.sh)

# Extract relevant information from dero_sales_list
dero_sales_list=$(echo "$dero_export_transfers" | jq -r '.result.entries[] | select(.payload_rpc != null) | (.time) + " " + (.payload_rpc[] | select(.name == "R" and .datatype == "A") | .value | tostring) + " " + (.amount | tostring) + " " + (.txid | tostring) + " " + (.dstport | tostring) + " " + (.payload_rpc[] | select(.name == "C" and .datatype == "S") | .value | tostring)')

# Process each sale entry
while read -r sale; do
    time=$(echo $sale | awk '{print $1}')
    addr=$(echo $sale | awk '{print $2}')
    amount=$(echo $sale | awk '{print $3}')
    txid=$(echo $sale | awk '{print $4}')
    dst_port=$(echo $sale | awk '{print $5}')
    comment=$(echo $sale | awk '{print $6}')

	# We call this the dero_db because they are trading XMR for DERO
    already_processed=$(cat "$dero_pong_db" | grep "$time")
    export time addr amount dst_port already_processed txid comment sale

    # Perform sorting and processing of pings
    source ./app/sort/_dero_pings.sh
done <<< "$dero_sales_list"

return
