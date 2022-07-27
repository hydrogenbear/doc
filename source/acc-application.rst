


General-purpose derivatives and its AMM on EVM chains. The derivatives are like European option but designed to be more blockchain native.

We have combined the Black-Scholes model and CFMM to make an auto market maker suitable to derivatives. We also designed a new kind of derivative that can make a single auto market maker providing different derivatives.

Poption is the name of the new kind of derivative. The name comes from 'payoff-', 'predict-', and 'popular-' option. Poption is a safe, general purpose, and capital efficient financial derivative designed for blockchain. It is a fully distributed financial product. Poption can provide users with a variety of financial services that were previously unavailable or too risky, such as hedging risks, speculation, etc.

A poption market maker will use information from both the spot market and the derivatives market to avoid being arbitrated. The poption market maker uses the spot market price as a free source of information, and integrate the information to the price of payoff tokens via Black-Scholes model and auto market maker algorithm. The market maker also preserves the information provided by the poption trader through the balances of liquidity pool. This make the poption market both simple as a CFMM and powerful to trade derivatives. One transaction of the swap cost from 400,000 to 700,000 gas.

I am a solo developer. I was a staff expert in data science in a finance company.

https://www.poption.exchange/ https://github.com/Poption-DeFi/poption-contract https://www.poption.exchange/whitepaper/Poption_Whitepaper.pdf https://docs.poption.exchange/en/index.html https://www.poption.exchange/poption/0x0d166fd1 https://polygonscan.com/tx/0xac2e4dbb05c4a2947642944269079e29bce59ee2ee4667d0bd948f616686f9c5

CoinMarketCap

Binance 20,081,029,271 41,784,387,685
        20,032,620,892 39,861,364,219   11,094,780,956 27,470,430,680
Uniswap    870,251,440
           874,543,959                  554,133,233
dydx                      515,346,827
                          537,439,343  415,837,939

binance_futures-trading-volume-1-year.csv
22831.203919214437
binance-trading-volume-1-year.csv
7526.618265491752
uniswap-trading-volume-1-year.csv
635.178247854084
dydx_perpetual-trading-volume-1-year.csv
634.329985176968


Binance 7526.61   22831.20
Uniswap  635.17
dydxi               634.32
