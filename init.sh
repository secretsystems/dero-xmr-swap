#!/bin/bash
date=$(date)
dero_ip="192.168.12.208"
dero_port="10103"
monero_ip="192.168.12.176"
monero_port="28088"
monero_pong_db="monero_pong.db"
xmr_dero_addr=$(source ./dero_make_integrated_address_1337.sh)
dero_xmr_addr=$(source ./dero_make_integrated_address_7331.sh)
echo "$xmr_dero_addr" > xmr4dero.addr 
echo "To trade xmr for dero: $xmr_dero_addr"
qrencode "$xmr_dero_addr" -o xmr_dero.png 
echo "$dero_xmr_addr" > dero4xmr.addr
echo "To trade dero for xmr $dero_xmr_addr"
qrencode "$dero_xmr_addr" -o dero_xmr.png 
echo "SERVICE MSG: xmr for dero address saved to xmr4dero.addr"
echo "SERVICE MSG: dero for xmr address saved to dero4xmr.addr"
if [ ! -s "$dero_pong_db" ] ; then
        echo "SERVICE MSG: No data found in DERO for XMR database"
fi
if [ ! -s "$monero_pong_db" ] ; then
       echo "SERVICE MSG: No data found in XMR for DERO database"
fi

cleanup() {
    echo "Cleaning up before exiting..."
    # Additional cleanup actions you may need before exiting
        killall timeout 2>/dev/null
	exit 0
}

# Set up the trap to call the cleanup function when SIGINT (Ctrl+C) is received
trap cleanup SIGINT

export date monero_pong_db dero_ip dero_port monero_ip monero_port monero_pong_db xmr_dero_ticker

while true; do
xmr_dero_ticker=$(source ./ticker.app)
echo "SERVICE MSG: XMR-DERO is trading at: $xmr_dero_ticker"
source ./dero_scan_wallet.sh 
done
