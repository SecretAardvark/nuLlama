
export def protocols [] {
    http get https://api.llama.fi/protocols |where category != "CEX" | select name tvl description
     | where tvl > 0 | sort-by tvl | reverse | first 25

}

export def protocol [protocol: string] {
    print "worked?"

    let protocolData = http get $"https://api.llama.fi/protocol/($protocol)"
    {name: $protocolData.name, url: $protocolData.url,  description: $protocolData.description , tvl: ($protocolData.tvl | last 25)}
}

#Defaults to total combined chain tvl if no chain parameter is provided
export def chainHistorical [chain?: string] {
    if $chain {
        http get $"https://api.llama.fi/v2/historicalChainTvl/($chain)"
    } else {
        http get $"https://api.llama.fi/v2/historicalChainTvl"
    }
}

export def current [protocol: string] {
    http get $"https://api.llama.fi/tvl/($protocol)"
}

export def chains [] {
    http get $"https://api.llama.fi/v2/chains" | sort-by tvl| reverse  | take 25  | select name tvl
}

export def charts [] {
    http get $"https://api.llama.fi/charts"
}

export def chainCharts [chain string] {
    http get $"https://api.llama.fi/charts/($chain)"
}
