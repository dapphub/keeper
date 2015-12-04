"use-strict";
var request = require("request");

module.exports = {
    polo: {
        get: function(ticker_symbol, callback) {
            if( ticker_symbol == "btc/eth/latest" ) {
                request("https://poloniex.com/public?command=returnTicker", function(err, res, body) {
                    if(err) {
                        callback(err);
                    } else {
                        var tickers = JSON.parse(body);
                        var btc_eth_last = Number(tickers["BTC_ETH"].last);
                        callback(null, btc_eth_last);
                    }
                });
            } else {
                callback(new Error("unknown ticker symbol:" + ticker_symbol));
            }
        }
    }
}


