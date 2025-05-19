
#Retrieve the latest data for all pools, including enriched information such as predictions.
export def pools [] { 
    http get "https://yields.llama.fi/pools"
}

#/chart/pools
#Get historical APY and TVL data for a pool.
#poolId can be retrieved from the /pools endpoint, property is chainId:poolId
export def pool [poolId: string] { 
    http get $"https://yields.llama.fi/chart/($poolId)"
}

