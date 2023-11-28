dero_dir=$HOME/dero/dero_linux_amd64
password_file=$dero_dir/password.txt
user="user"
pass="pass"
wallet=$dero_dir/secret-server.db
secret_ip=$(cat secret-ip-wallet.txt)
./dwc_by_slixe \
        --wallet-file=$wallet \
        --rpc-server \
        --rpc-bind=0.0.0.0:10103 \
        --unlocked \
        --password="serve secrets" \
        --rpc-login $user:$pass  \
        --save-every-x-seconds=300
