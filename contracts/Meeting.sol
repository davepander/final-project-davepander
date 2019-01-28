pragma solidity ^0.5.0;

import './MeetingBreaker.sol';
// import 'jsmnsol-lib/JsmnSolLib.sol';

contract Meeting {
    // A dynamically-sized array of `Motion` structs.
    // Proposal[] public motions;

    /** @dev Set the owner to the creator of this contract */
    constructor() public {

        address owner = msg.sender;
    }

    enum State { Called, Adjourned } // Enum
}
