# Intro
The idea here is this:

A user would ping a DERO integrated addr for either instructions on how to trade DERO for XMR ; or they would ping a different integrated addr for instructions on how to trade XMR for DERO wallet.

The only way that this private service for trading XMR-DERO could be possible is with the aid of DERO's encrypted messageing of up to 128 bytes.

### Youtube Demo
[![img alt txt](https://pbs.twimg.com/card_img/1698254004370001920/jwNXyJZU?format=jpg&name=small)](https://youtu.be/EWFFbzps2Ds?feature=shared)


## Sell DERO for XMR

### Obtain Trading Instructions

If you would like to purchase the trade instructions to sell DERO for XMR, ping here:
```
deroi1qyw4fl3dupcg5qlrcsvcedze507q9u67lxfpu8kgnzp04aq73yheqqdyvfp4x7z7t9hh2grpwfjjqarjv9jxjmn8ypzy25j0ypnx7u3qtpx4ygp68gsyxmmdwpkx2ar9yp68sgrxdaezqarjv9jx2grfdeehgun4vd68xgr5dusxyefqv3jkc6tkv4ex2epqw3hjq7t0w4ezqampd3kx2arzg323j89rvf892qrz2e2sygeaw9a
```

What this looks like in the DERO wallet is like this:
```
dero1qyv 2460983/2460983 0.06393  >>> 5
Enter current wallet password(8):
Enter Destination Address: deroi1qyw4fl3dupcg5qlrcsvcedze507q9u67lxfpu8kgnzp04aq73yheqqdyvfp4x7pltpx4yt2yg4fy7grfwvs8gunpv35kueeqv96zqdpn9cunsgp68gsxxmmdwpkx2ar9yp68sgrxdaezqarjv9jx2grfdeehgun4vd68xcjy25v3egmzfe2sqcjk25pqtz8g55
13/08 20:20:21	INFO	wallet	Destination port is integrated in address.	{"dst port": 7331}
13/08 20:20:21	INFO	wallet	Integrated Message	{"comment": "XMR-DERO is trading at 43.98 :: complete tx for trade instructs"}
13/08 20:20:21	INFO	wallet	Transaction	{"Value": "0.00002"}
13/08 20:20:21	INFO	wallet	This RPC has requested your address.
13/08 20:20:21	INFO	wallet	If you are expecting something back, it needs to be sent
13/08 20:20:21	INFO	wallet	Your address will remain completely invisible to external entities(only sender/receiver can see your address)
Confirm Transaction (y/N)y
13/08 20:20:37	INFO	wallet	Dispatched tx	{"txid": "4af726321e4a6c99c55cb85b9c8034e798ec23d9cfa9c85c199e43f6943a6bcd"}
```
Then in the wallet's tx history you would see the following:
```
13 Aug 23 20:22 MDT Height 2460989 TopoHeight 2460989 transaction 439ae71b2346dba7c1fe0ab2373146c6a41840657823c126b27e67497ecbbcbf received 0.00002 DERO Proof: deroproof1qy94d6w3ud3v8my978jg5c7yrzk7hc49xu9rq05x0hs7khptrkk3xq9zvfyyskpqw9ylegtj0v4phg6qcw3f3smdwx0ksx6cxnka2t05055hwr5xt7uky4j4qg3vcz30 RPC CALL arguments [Name:C Type:string Value:'Send DERO for XMR: dero1qyw4fl3dupcg5qlrcsvcedze507q9u67lxfpu8kgnzp04aq73yheqqg2ctjn4|port 7331|commemt: XMR addr']
```


### Submit DERO and return address for XMR 
The idea here is that when you want to obtain XMR from this service, you would need to use the following format to initialize the service: 

```
dero1qyv 2460992/2460992 0.06212  >>> 5
Enter current wallet password(8):
Enter Destination Address: dero1qyw4fl3dupcg5qlrcsvcedze507q9u67lxfpu8kgnzp04aq73yheqqg2ctjn4
Enter amount to transfer in DERO (current balance 0.06212): 0.001
Enter Please enter payment id (or destination port number) (default 0): 7331
Enter Comment (default ''): 43ES3b4x48CTUR5CnbMgQyH5zRP74WGks629kx32E8Xj2comx1D4xu5TsDEm6owKq5VBpFDdguEtHiPZE1TcoGor5RviTC5
Confirm Transaction (y/N)y
13/08 20:25:44	INFO	wallet	Dispatched tx	{"txid": "da4619061ca9b59de8b734e2f6ebd179bd0050fab38ef153045ea8ed74a14f10"}
```
After the transaction is dispatched, the service would pick up that there was a tx in the wallet that had an xmr comment in it. This wallet addr is validated on the Monero network and then XMR is dispatched,

## Buy DERO with XMR
### Obtain Tradinstructions

Like wise the reverse is true, if you would like to buy DERO with XMR, you would use the follwing address to ping the service in your DERO wallet:

```
deroi1qyw4fl3dupcg5qlrcsvcedze507q9u67lxfpu8kgnzp04aq73yheqqdyvfp4x7zat9hh2grpwfjjqcn4095kueeqg3z4yneqwa5hg6pqtpx4ygp68gsyxmmdwpkx2ar9yp68sgrxdaezq7rdwgs8gunpv3jjqctyv3ezqar0yp3x2gryv4kxjan9wfjkggr5dus8jmm4wgs8wctvd3jhgcjy25vs2wtzfe2sqcjk25pqrm2pm2
```
How this looks in the DERO wallet is like this:
```
dero1qyv 2461009/2461009 0.05931  >>> 5
Enter current wallet password(8):
Enter Destination Address: deroi1qyw4fl3dupcg5qlrcsvcedze507q9u67lxfpu8kgnzp04aq73yheqqdyvfp4x7p7tpx4yt2yg4fy7grfwvs8gunpv35kueeqv96zqdpn9cunsgp68gsxxmmdwpkx2ar9yp68sgrxdaezq7rdwgs8gunpv3jjqctyv3exy3z4ryznjcjw25qxy4j4qgk69vgy
13/08 20:29:30	INFO	wallet	Destination port is integrated in address.	{"dst port": 1337}
13/08 20:29:30	INFO	wallet	Integrated Message	{"comment": "XMR-DERO is trading at 43.98 :: complete tx for xmr trade addr"}
13/08 20:29:30	INFO	wallet	Transaction	{"Value": "0.00002"}
13/08 20:29:30	INFO	wallet	This RPC has requested your address.
13/08 20:29:30	INFO	wallet	If you are expecting something back, it needs to be sent
13/08 20:29:30	INFO	wallet	Your address will remain completely invisible to external entities(only sender/receiver can see your address)
Confirm Transaction (y/N)y
13/08 20:29:49	INFO	wallet	Dispatched tx	{"txid": "88e4c1731d9d0096bccde4b1766413df7af11e6d41d68284a3b842cd348c96f0"}

```
After a about 30 seconds or so, or a block or two on the DERO network, the wallet will receive a message in the wallet tx hisotry:
```
13 Aug 23 20:30 MDT Height 2461014 TopoHeight 2461014 transaction 2e81e54a9a5b3ccf87f2215651aeb3078b9d73e0bcc34821bed376333c7f28fc received 0.00002 DERO Proof: deroproof1qysp5vvf8e6z9ku4j5xuxj6sxldx6x75nhed5uafdpz0qwnpk4f8qqdzvfyyskpqphrhxy645vuwmk0j6vpdr8q452q6yrq9v9wct3nu8r8jsz24geqxy4j4qguyght2 RPC CALL arguments [Name:C Type:string Value:'XMR_Addr 4CVz8z7vTobDYXbWxMS5j3Zamjkmsk6vDRS8tRR5TUFJTggTKovWzkien1Vp8bXvKAP1hDFJwZjxUgRqjfmY9sNPP8jRXzEr56F6dK3y9q']
```
As you can see, the wallet service dispatches an integrated addr from the Monero network that has a payment id integrated with the addres.


### Submit XMR to address for DERO 

You would have about 20 minutes, per the timeout command running the Monero wallet scan, to pass a XMR from your preferred monero wallet to the host wallet. 

Once completed the service calculates the trade and sends DERO to the address that initially pinged the service. 

Pretty neat, huh?

# Dependencies
You will need `calc`, `bc`, `jq`, and `curl`
```
sudo apt install calc bc jq curl
```
You will also need both a monero and dero wallet running in RPC server mode.

Having your own Monero node and DERO node are not required, but it does increase the amount of privacy.

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

You are also going to want to change the ip addresses and ports for your respective wallets found at the head of  `init.sh`.

# Run
This is simpley an example of how to run this service.

1. Turn on derod
```
./derod-linux-amd64 --node-tag "secret-discord-server" --integrator-address dero123 --data-dir ~/Documents --rpc-bind=0.0.0.0:10102
```
2. Turn on monerod
```
./monerod --rpc-bind-ip=0.0.0.0 --confirm-external
```
3. Turn on dero-wallet-cli --rpc-server
```
./dero-wallet-cli-amd64 --wallet-file=wallet.db --rpc-server --rpc-bind=0.0.0.0:10103 --password=password --rpc-login user:pass --unlocked
```
4. Turn on monero-wallet-cli-rpc-server
```
./monero-wallet-rpc --rpc-bind-port 28088 --rpc-bind-ip 0.0.0.0 --wallet-file monero-wallet --password secret-server --confirm-external-bind --trusted-daemon --rpc-login user:pass
```
5. Configure app/config/.env
There isn't a `.env` file, but there is a `app/config/dot_env.sample` you can use to make your `.env` file.

After you have configured, be sure to:
```sh
source app/config/.env
```

5. Turn on xmr-dero swap
```
./init.sh
```

# Goodies
## db
You will find that this service makes some `.db` files. There just place holders for valid txs and not a real database file.

## addr
You will find that this service deposits your integrated addrs to the respective `.addr` files.
