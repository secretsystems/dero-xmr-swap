# monero script
source common.sh
./monero-wallet-rpc \
--rpc-bind-port 28088 \
--rpc-bind-ip 0.0.0.0 \
--wallet-file monero-wallet \
--password $mponero_pass\
--confirm-external-bind \
--trusted-daemon \
--rpc-login $user:$mopnero_pass
