pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Board.sol";

contract TestBoard {
  // The address of the adoption contract to be tested
  Board board = Board(DeployedAddresses.Board());

  // The expected Chair/Owner of the Board
  address newBoardMem = 0x1c88ecb319CdfED2434Fa576F702658FB245Fcd1;

  // Can we add a Board Member
  function testAddBoardMem() public {
    bool returnState = board.addBoardMem(newBoardMem,"David","Anderson");
    Assert.isTrue(returnState,"Board Member Added.");
  }

  function testListBoardName() public {
    string returnState = board.listBoardName(newBoardMem);
    Assert.equal("Anderson",returnState);
  }

}
