#/overview/fees 
#list all protoccols along with their fees, revenue, and dataType history data.
export def fees [ excludeTotalDataChart: bool = true, excludeTotalDataChartBreakdown: bool = true, dataType: string = "dailyRevenue"] {
    http get $"https://api.llama.fi/overview/fees?excludeTotalDataChart=($excludeTotalDataChart)&excludeTotalDataChartBreakdown=($excludeTotalDataChartBreakdown)&dataType=($dataType)"
}

#/overview/fees/{chainId}
#list all protocols along with their fees, revenue, and dataType history data for a given chain.
#dataType can be dailyRevenue or dailyFees
export def feesByChain [chainId: int, excludeTotalDataChart: bool = true, excludeTotalDataChartBreakdown: bool = true, dataType: string = "dailyFees"] {
    http get $"https://api.llama.fi/overview/fees/($chainId)?excludeTotalDataChart=($excludeTotalDataChart)&excludeTotalDataChartBreakdown=($excludeTotalDataChartBreakdown)&dataType=($dataType)"
}

#/summary/fees/{protocol}
#list all protocols along with their fees, revenue, and dataType history data.
#dataType can be dailyRevenue or dailyFees
export def feesByProtocol [protocol: string, dataType: string = "dailyFees"] {
    http get $"https://api.llama.fi/summary/fees/($protocol)?dataType=($dataType)"
}



test 1 2 