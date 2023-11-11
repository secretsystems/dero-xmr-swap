#!/usr/bin/env bash

# obtain environment variables

source common.sh

# generate assets

generate_assets() {
    local pair="$1"
    local addr_script="$2"
    local addr_file="$3"
    local qr_output="$4"

    addr=$("$addr_script")
    echo "$addr" > "$addr_file"
    echo "SERVICE MSG: trade $pair using $addr_file"
    qrencode "$addr" -o "$qr_output"
    echo "SERVICE MSG: Assets saved to $addr_file"
}

generate_assets "xmr for dero" ./app/generate/_integrated_addr_xmr_for_dero.sh app/assets/xmr_for_dero.addr app/assets/xmr_for_dero.png
generate_assets "dero for xmr" ./app/generate/_integrated_addr_dero_for_xmr.sh app/assets/dero_for_xmr.addr app/assets/dero_for_xmr.png


if [ ! -s "$dero_pong_db" ] ; then
    echo "SERVICE MSG: No data found in DERO for XMR database"
fi
if [ ! -s "$monero_pong_db" ] ; then
    echo "SERVICE MSG: No data found in XMR for DERO database"
fi


while true; do
    xmr_dero_ticker=$(source ./app/quote/_xmr_for_dero.sh)
    echo "SERVICE MSG: XMR-DERO is trading at: $xmr_dero_ticker"
    source ./app/scan/_dero_wallet.sh
done

# Set up the trap to call the cleanup function when SIGINT (Ctrl+C) is received
trap cleanup SIGINT

cleanup() {
    echo "Cleaning up before exiting..."

    # Additional cleanup actions you may need before exiting
    killall timeout 2>/dev/null
	exit 0
}
