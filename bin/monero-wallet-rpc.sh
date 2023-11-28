# monero script
user="user"
pass="pass"
./monero-wallet-rpc \ 
--rpc-bind-port 28088 \ 
--rpc-bind-ip 0.0.0.0 \
--wallet-file monero-wallet \
--password secret-server \
--confirm-external-bind \
--trusted-daemon \
--rpc-login $user:$pass 

