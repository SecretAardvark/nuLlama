# currentPrices
export def currentPrices[...coins: string] {
    http get $"https://api.llama.fi/prices/current/coingecko:($coins)"
}
# firstPrices
# historicalPrices
# batchHistorical
# chart
# percentage
# block
