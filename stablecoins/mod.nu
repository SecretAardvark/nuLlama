#all /stablecoins 
#List all stablecoins along with their circulating amounts.
export def all [] { 
    http get "https://stablecoins.llama.fi/stablecoins"
}


#/stablecoincharts/all
#Get historical mcap sum of all stablecoins. 
#pass an id to get a specific chart. Get an id from /stablecoins (all)
export def allCharts [id?:int] { 
    http get $"https://stablecoins.llama.fi/stablecoincharts/all(if $id != null { $"?stablecoins=($id)" })"
}

#chainHistory /stablecoincharts/{chain}
#Get historical mcap sum of all stablecoins on a chain.
#chain is the chain slug, you can get these from /chains or the chains property on /protocols
export def chainHistory [chain: string, id?:int] { 
    http get $"https://stablecoins.llama.fi/stablecoincharts/($chain)(if $id != null { $"?stablecoins=($id)" })"
}

#assetHistory /stablecoincharts/{stablecoinId}
#Get historical mcap and historical chain distribution of a stablecoin.
export def assetHistory [stablecoinId: int] { 
    http get $"https://stablecoins.llama.fi/stablecoincharts/($stablecoinId)"
}
#chainOverview /stablecoinchains
#get current mcap sum of all stablecoins each chain.
export def chainOverview [] { 
    http get "https://stablecoins.llama.fi/stablecoinchains"
}

#priceHistory /stablecoinprices
#get historical price of all stablecoins.
export def priceHistory [] { 
    http get $"https://stablecoins.llama.fi/stablecoinprices/"
}

#priceHistory /stablecoinprices/{stablecoinId}
#get historical price of a stablecoin.
