# currentPrices
export def currentPrices [...coins: string] {
    if ($coins | is-empty) {
        noCoinError 
        return  
    }
    
    let formatted_coins = formatCoins $coins
    http get $"https://coins.llama.fi/prices/current/($formatted_coins)"
}
# firstPrices
export def firstPrices [...coins: string] {
    
    if ($coins | is-empty) {
        noCoinError 
        return
    }
    let formatted_coins = formatCoins $coins
    http get $"https://coins.llama.fi/prices/first/($formatted_coins)"
}
# historicalPrices
export def historicalPrices [timestamp: int, ...coins: string] {
    if ($coins | is-empty) {
        noCoinError 
        return
    }
    let formatted_coins = formatCoins $coins
    
    http get $"https://coins.llama.fi/prices/historical/($timestamp)/($formatted_coins)"
}
# TODO: fix this. 
# batchHistorical
export def batchHistorical [
    coins,  # Accept any value
    searchWidth?: string
] {
    # Validate that coins is a record
    if (not ($coins | describe | str contains "record")) {
        error make { msg: "Expected coins to be a record" }
    }
    
    if ($coins | is-empty) {
        noCoinError
        return
    }
    
    let coins_json = $coins | to json
    let coins_encoded = $coins_json | url encode
    let base_url = $"https://coins.llama.fi/batchHistorical?coins=($coins_encoded)"
    let url = if ($searchWidth != null) { $"($base_url)&searchWidth=($searchWidth)" } else { $base_url }

    http get $url
}
# chart

#Strings accepted by period and searchWidth: Can use regular chart candle notion like '4h' etc where: W = week, D = day, H = hour, M = minute (not case sensitive)
export def chart [...coins: string, start: int, end: int=0, searchWidth?: string='', span: int=10,  period?: string] {
    if ($coins | is-empty) {
        noCoinError
        return
    }
    let formatted_coins = formatCoins $coins
    http get $"https://coins.llama.fi/chart/($formatted_coins)?start=($start)( if (end != 0) { $"&end=($end)" })&span=($span)&period=($period)
            (if $searchWidth != '' { $"&searchWidth=($searchWidth)" })"
}
# percentage
export def percentage [...coins: string] { 
    if ($coins | is-empty) {
        noCoinError
        return
    }
    let formatted_coins = formatCoins $coins
    http get $"https://coins.llama.fi/percentage/($formatted_coins)"
}
# block
export def block [chain: string, timestamp: int] {
    http get $"https://coins.llama.fi/block/($chain)/($timestamp)"
}
#Ensure at least one coin is provided
def noCoinError [] {
    error make { msg: "At least one coin argument is required." }
}
# Format coins for the API: prepend 'coingecko:' and join with commas
export def formatCoins [coins: list<string>] {
    $coins | each { |coin| $"coingecko:($coin)" } | str join ","
}
