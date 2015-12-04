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
        if( feed_path == "polo/btc/eth/latest" ) {
            feed_sources.polo.get("btc/eth/latest", function(err, val) {
                callback(err, val);
            });
        } else {
            callback(new Error("unknown feed path: " + path));
        }
    }
    set( feed_path, value, callback ) {
        feed_sinks.setFeed(feed_path, value, callback);
    }
}
