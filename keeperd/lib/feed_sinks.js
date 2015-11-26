function setKeeperFeed(address, key, value, cb) {
    // TODO submit geth transaction
    cb(new Error("unimplemented"), null);
}
module.exports = {
    setFeed(feed_symbol, value, cb) {
        if( feed_symbol == "mykeeper.dai_eth" ) {
            setKeeper("", "dai_eth", value, cb);
        } else {
            cb(new Error("unknown feed sink"), null);
        }
    }
}
