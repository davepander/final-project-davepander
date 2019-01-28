pragma solidity ^0.5.0;


contract Board {

    address private owner;

    constructor() public {
        /* Set the owner to the creator of this contract */
        owner = msg.sender;
    }

    event BoardCreated(address chair); // Event
    event NewBoardMember(address member); //Event

    mapping(address => bool) boardMembers;

    modifier onlyBoard {
      require(boardMembers[msg.sender] == true || msg.sender == owner);
      _;
    }

    function addBoardMem(address _m)
      public
      onlyBoard
      returns(bool) {
        boardMembers[_m] = true;
        emit NewBoardMember(_m);
        return true;
      }


    //This function allows for the destruction of the contract
    /*function kill()
    public
    {
      if(msg.sender == owner){
        selfdestruct(owner);
        _;
      }
    }
    */

    //
    // State variables
    //


}
