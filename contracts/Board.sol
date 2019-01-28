pragma solidity ^0.5.0;

/** @title The Board */
contract Board {

    address payable owner;

    /** @dev Creates the Board and sets the Owner */
    constructor() public {
        /* Set the owner to the creator of this contract */
        owner = msg.sender;
    }

    /** @dev Event for Board Creation */
    event BoardCreated(address chair); // Event

    /** @dev Event for a new Board Member */
    event NewBoardMember(address member); //Event

    /** @dev The list of Board Members */
    mapping(address => bool) boardMembers;

    /** @dev Modifier requiring a board member or the Chair */
    modifier onlyBoard {
      require(boardMembers[msg.sender] == true || owner == msg.sender);
      _;
    }

    /** @dev Function to add a member, this will be wrapped by a specific
        Motion type as adding members is an act of the Board by vote.
        @param The address for the new Board Member. */
    function addBoardMem(address _m)
      internal
      onlyBoard
      returns(bool) {
        boardMembers[_m] = true;
        emit NewBoardMember(_m);
        return true;
      }


    /** @dev This function allows for the destruction of the contract only
        by the owner.  This dissolves the board, and would also need to be
        wrapped by a Board Vote */
    function kill()
    public
    {
      if(msg.sender == owner){
        selfdestruct(owner);
      }
    }



}
