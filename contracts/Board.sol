pragma solidity ^0.5.0;


contract Board {
    struct BoardMember {
      address account;
      string first;
      string last;
    }

    address payable owner;
    mapping(address => bool) boardMembers;
    mapping(address => BoardMember) public registry;

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

    function addBoardMem(address _m, string memory _first, string memory _last)
      public
      onlyBoard
      returns(bool) {
        boardMembers[_m] = true;
        emit NewBoardMember(_m);

        BoardMember memory newMember = BoardMember({
          account:_m,
          first:_first,
          last:_last
        });
        registry[_m] = newMember;

        return true;
      }

    function listBoardName(address n) public view returns(string memory) {
      return registry[n].last;
    }

    //This function allows for the destruction of the contract
    function kill()
    public
    {
      if (msg.sender == owner) selfdestruct(owner);
    }


}
