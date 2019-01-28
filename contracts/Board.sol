pragma solidity ^0.5.0;


contract Board {

    address payable owner;
    mapping(address => bool) boardMembers;

    constructor() public {
        /* Set the owner to the creator of this contract */
        owner = msg.sender;
        boardMembers[owner] = true;
    }

    event BoardCreated(address chair); // Event
    event NewBoardMember(address member); //Event

    modifier onlyBoard {
      require(boardMembers[msg.sender] == true);
      _;
    }

    function addBoardMem(address _m)
      internal
      onlyBoard
      returns(bool) {
        boardMembers[_m] = true;
        emit NewBoardMember(_m);
        return true;
      }


    //This function allows for the destruction of the contract
    function kill()
    public
    {
      if (msg.sender == owner) selfdestruct(owner);
    }


    //
    // State variables
    //


}
