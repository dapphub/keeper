contract FeedBase
{
    mapping( address => mapping( bytes32 => bytes32 ) ) values;
    event Set(address setter, bytes32 key, bytes32 value);
    function set(bytes32 key, bytes32 value) returns (bool ok) {
        values[msg.sender][key] = value;
        Set(msg.sender, key, value);
        return true;
    }
    function get(address feeder, bytes32 key) returns (bytes32 value, bool ok) {
        return (values[feeder][key], true);
    }
}
