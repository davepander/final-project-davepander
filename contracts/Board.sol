pragma solidity ^0.5.0;

/**
 * @title Contract for a Board Entity for an transparent real world organization
 * @author David Anderson
 */
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

    /// @notice A Board has been created
    event BoardCreated(address chair); // Event

    /// @notice A New Board Member has been added
    event NewBoardMember(address member); //Event

    /// @dev Verify that certain function calls are restricted to Board Members
    modifier onlyBoard {
      require(boardMembers[msg.sender] == true);
      _;
    }

    /// @notice A board member has been Added
    /// @dev This creates an entry for the mapping that determines who has
    /// access to certain functions and
    /// creates a publicly viewable record of the members of the board.
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


    /**
     * @notice This is a public function for anyone to see who is on the board.
     */
    function listBoardName(address n) public view returns(string memory) {
      return registry[n].last;
    }

    /// This function allows for the destruction of the contract
    function kill()
    public
    {
      if (msg.sender == owner) selfdestruct(owner);
    }


}
