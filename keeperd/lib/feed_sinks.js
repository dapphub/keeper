var headers = require("../dapp/build/js_module");
var Web3 = require("web3");
var web3 = new Web3();

// TODO instantiate from config
web3.setProvider(new web3.providers.HttpProvider("http://localhost:8545"));
var FeedBase = headers.FeedBase;
FeedBase.interface = JSON.parse(FeedBase.interface);

function setKeeperFeed(key, value, cb) {
    // TODO submit geth transaction
    var feedbase_type = web3.eth.contract(FeedBase.interface);
    var feedbase = feedbase_type.at("0x82118c7a559b14db0a5692f0ed77808d00533946"); //TODO get from env
    feedbase.set(key, web3.toBigNumber(value), {
        from: web3.eth.coinbase
    },  function(err, res) {
        cb(err, res);
    });
}
module.exports = {
    setFeed(feed_symbol, value, cb) {
        if( feed_symbol == "feedbase/mykeeper/sdr_eth" ) {
            setKeeperFeed("sdr_eth", value, cb);
        } else {
            cb(new Error("unknown feed sink"), null);
        }
    }
}
