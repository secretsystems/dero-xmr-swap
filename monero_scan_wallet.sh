#!/bin/bash
s=18
#get the pid and export it
timeout_pid=$$
export timeout_pid
echo "XMR WALLET SCAN: INITIATED WITH PROCESS ID $timeout_pid"

while true; do
# Get a list of transfers
monero_pong_db="monero_pong.db"

# Check  if in db
if [ ! -s "$monero_pong_db" ] ; then
                echo "No tx history in DERO for XMR db, yet"
fi

touch $monero_pong_db
export monero_pong_db
source ./monero_process_sales.sh
sleep $s
done
