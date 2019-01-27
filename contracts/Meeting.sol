pragma solidity ^0.5.0;

contract Meeting {
// A dynamically-sized array of `Motion` structs.
    Proposal[] public motions;

    constructor() public {
        /* Set the owner to the creator of this contract */
        owner = msg.sender;
    }

    enum State { Called, Adjourned } // Enum
}
