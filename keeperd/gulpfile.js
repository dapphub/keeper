var gulp = require("gulp");
var headers = require("./dapp/build/js_module.js");
var sinks = require("./lib/feed_sinks");
var Web3 = require("web3");
var web3 = new Web3();
web3.setProvider(new web3.providers.HttpProvider("http://localhost:8545"));

console.log(headers);
var FeedBase = headers.FeedBase;
console.log(headers);
//FeedBase.interface = JSON.parse(FeedBase.interface);
var feedbase_type = web3.eth.contract(FeedBase.interface);
var feedbase = feedbase_type.at("0x82118c7a559b14db0a5692f0ed77808d00533946"); //TODO get from env

gulp.task('new_feedbase', function() {
    type.new({
        data: "0x" + FeedBase.bytecode,
        from: web3.eth.coinbase,
        gas: 3000000
    }, function(err, instance) {
        if(err) throw err;
        if( instance.address ) {
            console.log(instance.address);
        }
    });
});

gulp.task('set_test_feed', function() {
    sinks.setFeed("feedbase/mykeeper/sdr_eth", 100, function(err, res) {
        console.log(err, res);
    });
});

gulp.task('get_test_feed', function() {
    sources.getFeed("feedbase/mykeeper/sdr_eth", eth.accounts[0], function(err, res) {
    });
});
