var chai = require("chai");
var expect = chai.expect;

var FeedRouter = require("../lib/feed_router");
var fr = new FeedRouter();

describe("class FeedRouter", function() {
    it("getFeed gets polo data", function(done) {
        fr.get("polo.btc_eth.latest", function(err, val) {
            if( err ) { throw err; }
            console.log(val);
            expect(val).to.be.a('number');;
            done();
        });
    });
});
