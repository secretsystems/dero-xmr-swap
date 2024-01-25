#!/usr/bin/env bash

# obtain environment variables

source bin/common.sh

# generate assets

generate_assets() {
    local pair="$1"
    local addr_script="$2"
    local addr_file="$3"
    local qr_output="$4"

    addr=$("$addr_script")
    echo "$addr" > "$addr_file"
    qrencode "$addr" -o "$qr_output"
}

generate_assets "xmr for dero" ./app/generate/_integrated_addr_xmr_for_dero.sh app/assets/xmr_for_dero.addr app/assets/xmr_for_dero.png
generate_assets "dero for xmr" ./app/generate/_integrated_addr_dero_for_xmr.sh app/assets/dero_for_xmr.addr app/assets/dero_for_xmr.png

echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') Assets saved to app/assets/"


if [ ! -s "$dero_pong_db" ] ; then
    echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') No data found in DERO for XMR database"
fi
if [ ! -s "$monero_pong_db" ] ; then
    echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') No data found in XMR for DERO database"
fi

pair_ticker=$(source ./app/quote/_xmr_for_dero.sh)

# Display sleep duration
echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') Sleep is set for $seconds seconds"
echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') DERO is trading at $pair_ticker XMR"
echo "SERVICE MSG: $(date '+%Y-%m-%d %H:%M:%S') Swap is ready"

while true; do
    source ./app/scan/_dero_wallet.sh
done
