
# Collect quote for USDT-XMR pair
Get_USDTXMR=$(curl -s -X GET https://tradeogre.com/api/v1/ticker/xmr-usdt | jq -r '. | (.ask)')
USDTXMR_MESSAGE=$(echo "USDT-XMR: $Get_USDTXMR")

# Obtain USDT value of the transfer amount
# Monero is ^12
amount_usdt=$(calc "$Get_USDTXMR"*"$amount"*"0.000000000001")
AMOUNT_MESSAGE=$(echo "Your XMR is valued at: $amount_usdt USDT")

# Get ask for USDT-DERO pair
Get_USDTDERO=$(curl -s -X GET https://tradeogre.com/api/v1/ticker/dero-usdt | jq -r '. | (.ask)')
USDTDERO_MESSAGE=$(echo "USDT-DERO: $Get_USDTDERO")

# Obtain amount as referenced as amount of dero
amount_dero=$(bc <<< "scale=5;$amount_usdt / $Get_USDTDERO")
ASK_MESSAGE=$(echo "Conversion Total: $amount_dero")

# Retain a % of dero as fee
fee_dero=$(echo "$amount_dero*0.01" | bc)
FEE_MESSAGE=$(echo "Service Fee: $fee_dero")

# Retain a % of dero as fee
trade_dero=$(echo "$amount_dero*0.99" | bc)
TRADE_MESSAGE=$(echo "Sending: $trade_dero")

# Remove decimals
num="$trade_dero"
num_without_decimal=${num//./}
amnt="$num_without_decimal"

# Trim leading zeroes
if [[ "$amnt" =~ ^0+([1-9][0-9]*)$ ]]; then
	  amnt=$(expr "$amnt" + 0)
fi
echo "DERO WALLET: send DERO to recipient | amount $amnt"
export amnt
