pragma solidity ^0.5.0;

import './MotionBreaker.sol';

contract Motion {

   constructor() public {
      /* Set the owner to the creator of this contract */
      address owner = msg.sender;
   }

   enum State {Passed, Failed} //Enum

    // This type represents a single board vote.
    struct MemberVote {
        bool voted;  // if true, that person already voted
        uint meeting; //index of the board meeting
        uint motion;   // index of the voted motion
    }

    // This is a type for a single motion.
    struct Proposal {
        bytes32 name;   // short name (up to 32 bytes)
        uint voteCount; // number of accumulated votes
    }
}
