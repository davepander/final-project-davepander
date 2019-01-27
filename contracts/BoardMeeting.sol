pragma solidity ^0.5.0;

contract BoardMeeting {

  mapping(address => bool) bmembers;

    modifier onlyBoard {
      require(bmembers[msg.sender] == true);
    }

    function addBoardMem(address _m)
      internal
      onlyBoard
      returns(bool) {
        bmembers[_m] = true;
        return true;
      }


    //This function allows for the destruction of the contract
    function kill(){
      if(msg.sender == owner){
        selfdestruct(owner);
      }
    }


    //
    // State variables
    //


}
