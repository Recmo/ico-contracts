pragma solidity 0.4.15;

import './MPolicy.sol';


contract Daily is MPolicy {

    ////////////////////////
    // Public functions
    ////////////////////////

    function snapshotAt(uint256 timestamp)
        public
        constant
        returns (uint256)
    {
        // Round down to the start of the day (00:00 UTC)
        timestamp -= timestamp % 1 days;

        return timestamp;
    }

    ////////////////////////
    // Internal functions
    ////////////////////////

    //
    // Implements MPolicy
    //

    function mNextSnapshotId()
        internal
        returns (uint256)
    {
        // Take the current time in UTC
        uint256 timestamp = block.timestamp;

        // Round down to the start of the day (00:00 UTC)
        timestamp -= timestamp % 1 days;

        return timestamp;
    }

    function mFlagSnapshotModified()
        internal
    {
    }
}
