source common.sh
dero_dir=$HOME/dero/dero_linux_amd64
wallet=$dero_dir/secret-server.db
./dero-wallet-cli-linux-amd64 \
        --wallet-file=$wallet \
        --rpc-server \
        --rpc-bind=0.0.0.0:10103 \
        --unlocked \
        --password=$dero_pass \
        --rpc-login $user:$dero_pass  \
        --save-every-x-seconds=300
