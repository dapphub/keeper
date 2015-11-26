"use strict";
var feed_sources = require("./feed_sources");
var feed_sinks = require("./feed_sinks");

module.exports = class FeedRouter {
    constructor() {
        this.sources = feed_sources;
        this.sinks = feed_sinks;
    }
    get( feed_path, callback ) {
        // TODO use more intelligent routing
        if( feed_path == "polo.btc_eth.latest" ) {
            feed_sources.polo.get("btc_eth.latest", function(err, val) {
                callback(err, val);
            });
        }
    }
}
