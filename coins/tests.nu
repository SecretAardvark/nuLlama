use std assert
use ./mod.nu *

# Test formatCoins helper function
def test_format_coins [] {
    try {
        let result = do { formatCoins ["ethereum", "bitcoin"] }
        assert ($result == "coingecko:ethereum,coingecko:bitcoin")
        print "test_format_coins passed"
    } catch { |e|
        print "test_format_coins failed"
        print $"($e.msg)"
    }
}

# Test error handling for empty coin list
def test_no_coin_error [] {
    let result = try { 
        currentPrices 
    } catch { |e| 
        $e.msg
    }
    
    try {
        assert ($result == "At least one coin argument is required.")
        print "test_no_coin_error passed"
    } catch { |e|
        print "test_no_coin_error failed"
        print $"($e.msg)"
    }
}

# Test API endpoint construction (mock version)
def test_current_prices [] {
    let result = currentPrices "ethereum"
    try {
        assert ($result | describe | str contains "record")
        print "test_current_prices passed"
    } catch { |e|
        print "test_current_prices failed"
        print $"($e.msg)"
    }
    
}

# Test batchHistorical URL construction
def test_batch_historical [] {
    let coins = { "coingecko:ethereum": [1666869543, 1666862343] }    
    
    let result = batchHistorical $coins
    try {
        assert ($result | describe | str contains "record")
        print "test_batch_historical passed"
    } catch { |e|
        print "test_batch_historical failed"
        print $"($e.msg)"
    }
}

export def main [] {
    test_format_coins
    test_no_coin_error
    test_current_prices
    test_batch_historical
}
