var Router = require("../lib/feed_router");
var router = new Router();

var feed_cache = {
    "polo/btc/eth/latest": null
}

setInterval(function() {
    router.get("polo/btc/eth/latest", function(err, price) {
        if (err) throw err; // pm2 will log and restart
        console.log("fetched price: ", price);
        feed_cache["polo/btc/eth/latest"] = price;
    });
}, 2000);

setInterval(function() {
    var price = feed_cache["polo/btc/eth/latest"];
    console.log("submitting price:", price);
    router.set("feedbase/mykeeper/sdr_eth", price, function(err, res) {
        console.log(err, res);
    });
}, 20000);
