pragma solidity ^0.5.0;

import './MotionBreaker.sol';

/** @title A Motion contract, which maps to "Votable" Agenda items
 *    This also records the votes for each motion within each meeting.
 */
contract Motion {

    uint motion;
    uint meeting;

    /** @dev A Motion can be Pending, Passed, or Failed */
    enum State {Pending, Passed, Failed} //Enum

   /** @dev Constructor for Motion contract
       @param _meeting meeting ID of the active board meeting
       @param _motion current motion under consideration */
   constructor(uint _meeting, uint _motion) public {
       motion = _motion;
       meeting = _meeting;
   }

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
