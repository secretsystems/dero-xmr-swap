
# Collect quote for USDT-DERO pair
Get_USDTDERO=$(curl -s -X GET https://tradeogre.com/api/v1/ticker/dero-usdt | jq -r '. | (.bid)')
USDTDERO_MESSAGE=$(echo "USDT-DERO: $Get_USDTDERO")

# Obtain USDT value of the transfer amount
# DERO is ^5
amount_usdt=$(calc "$Get_USDTDERO"*"$amount"*"0.00001")
AMOUNT_MESSAGE=$(echo "Your DERO is valued at: $amount_usdt USDT")

# Get bid for USDT-XMR pair
Get_USDTXMR=$(curl -s -X GET https://tradeogre.com/api/v1/ticker/xmr-usdt | jq -r '. | (.bid)')
USDTXMR_MESSAGE=$(echo "USDT-XMR: $Get_USDTXMR")

# Obtain amount as referenced as amount of xmr
amount_xmr=$(bc <<< "scale=12;$amount_usdt / $Get_USDTXMR")
ASK_MESSAGE=$(echo "Conversion Total: $amount_xmr")

# Retain a % of xmr as fee
fee_xmr=$(echo "$amount_xmr*0.01" | bc)
FEE_MESSAGE=$(echo "Service Fee: $fee_xmr")

# Retain a % of xmr as fee
trade_xmr=$(echo "$amount_xmr*0.99" | bc)
TRADE_MESSAGE=$(echo "Sending: $trade_xmr XMR")

# Remove decimals
num="$trade_xmr"
num_without_decimal=${num//./}
amnt="$num_without_decimal"

# Trim leading zeroes
if [[ "$amnt" =~ ^0+([1-9][0-9]*)$ ]]; then
	  amnt=$(expr "$amnt" + 0)
fi
echo " XMR WALLET: send XMR to recepient | amount $amnt"
