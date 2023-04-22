# Intro
The idea here is this:

Ping DERO addr -> get XMR addr in DERO wallet: Deposit XMR -> XMR addr -> get DERO 

Ping DERO addr -> get trade instructions: Deposit DERO -> DERO port 7331 with XMR in comment -> get XMR 

# Working Demo
If you would like to purchase the trade instructions to trade DERO for XMR, ping here:
```
deroi1qyw4fl3dupcg5qlrcsvcedze507q9u67lxfpu8kgnzp04aq73yheqqdyvfp4x7q6tpx4ygrxdaezq3z92f8jqarjv9jx2grpv3j8yetnwd3yg4geq5ukynj4qp39v4gzdn9nv2
```

If you would like to purchase XMR for DERO trade instructions, ping here:
```
deroi1qyw4fl3dupcg5qlrcsvcedze507q9u67lxfpu8kgnzp04aq73yheqqdyvfp4x7pqg3jhymeqvehhygzcf4fzq4rjv9jx2gzfdeehgun4vd6xjmmwwvhxy3z4ryw2xcjw25qxy4j4qgju59zp
```

# Dependencies
You will need `calc`, `bc`, `jq`, and `curl`

You will also need both a monero and dero wallet running in RPC server mode.

# Install
Get this repo:
```
git clone https://github.com/secretnamebasis/xmr-dero-swap/
```

Move into the repo and mark all the scripts as executable:
```
cd xmr-dero-swap
chmod +x *.sh
```

# Run
To run:
```
./init.sh
```

# Goodies
## db
You will find that this service makes some `.db` files. There just place holders for valid txs and not a real database file. 

## addr
You will find that this service deposits your integrated addrs to the respective `.addr` files.

