#/overview/dexs 
# list all dexs along with summareis of their volumes and dataType history data.
export def dexs [excludeTotalDataChart: bool = true, excludeTotalDataChartBreakdown: bool = true] { 
    http get $"https://api.llama.fi/overview/dexs?excludeTotalDataChart=($excludeTotalDataChart)&excludeTotalDataChartBreakdown=($excludeTotalDataChartBreakdown)"
}


#/overview/dexs/{chainId}
# list all dexs for a given chain along with summareis of their volumes and dataType history data.
export def dexsByChain [chainId: int, excludeTotalDataChart: bool = true, excludeTotalDataChartBreakdown: bool = true] { 
    http get $"https://api.llama.fi/overview/dexs/($chainId)?excludeTotalDataChart=($excludeTotalDataChart)&excludeTotalDataChartBreakdown=($excludeTotalDataChartBreakdown)"
}

#/summary/dexs/{protocol}
# get summary of volumes and dataType history data for a given protocol.
export def summaryByProtocol [protocol: string, excludeTotalDataChart: bool = true, excludeTotalDataChartBreakdown: bool = true] { 
    http get $"https://api.llama.fi/summary/dexs/($protocol)?excludeTotalDataChart=($excludeTotalDataChart)&excludeTotalDataChartBreakdown=($excludeTotalDataChartBreakdown)"
}

#/overview/options 
# list all options along with summareis of their volumes and dataType history data.
export def dexsOptions [excludeTotalDataChart: bool = true, excludeTotalDataChartBreakdown: bool = true, dataType: string = "dailyPremiumVolume"] { 
    http get $"https://api.llama.fi/overview/options?excludeTotalDataChart=($excludeTotalDataChart)&excludeTotalDataChartBreakdown=($excludeTotalDataChartBreakdown)&dataType=($dataType)"
}

#/overview/options/{chainId}
# list all options for a given chain along with summareis of their volumes and dataType history data.
export def dexsOptionsByChain [chainId: int, excludeTotalDataChart: bool = true, excludeTotalDataChartBreakdown: bool = true, dataType: string = "dailyPremiumVolume"] { 
    http get $"https://api.llama.fi/overview/options/($chainId)?excludeTotalDataChart=($excludeTotalDataChart)&excludeTotalDataChartBreakdown=($excludeTotalDataChartBreakdown)&dataType=($dataType)"
}

#/summary/options/{protocol}
# get summary of volumes and dataType history data for a given protocol.
export def optionsByProtocol [protocol: string, dataType: string = "dailyPremiumVolume"] { 
    http get $"https://api.llama.fi/summary/options/($protocol)?dataType=($dataType)"
}





