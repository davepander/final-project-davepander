pragma solidity ^0.5.0;

// import './MeetingBreaker.sol';
// import 'jsmnsol-lib/JsmnSolLib.sol';
// import './Motion.sol';

contract Meeting {

    address chairPerson;
    enum State { Called, Adjourned } // Enum

    // An array of `Motion` structs.
    //Motion[] public motions;
    //Present[] public address;

    /** @dev Set the owner to the creator of this contract */
    constructor() public {
        chairPerson = msg.sender;
    }

    /*
    function checkIn() public {
        //Function for Board Members to check-in to the meeting.
    };*/

    /*
    function getAgenda () public {
      //Function for retrieving and parsing the Agenda JSON object into
      an array of Motion calls.
    };
    */

    /*function Adjourn () public returns(bool) {
      // Check to see if all proposals are done

      // If not complete

      // If complete Return


    }*/

}
