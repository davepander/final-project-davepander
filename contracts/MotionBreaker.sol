pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

// @title Motion Breaker
contract MotionBreaker is Ownable {
  enum MotionStates { Started, Stopped }
  MotionStates public state;

  constructor ()
    public
  {
    state = MotionStates.Started;
  }

  // Only allow function to be executed with Motion Contract is in state "Started"
  modifier motionStarted() {
    require(state == MotionStates.Started);
    _;
  }

  // Enables circuit breaker stopping all functionality
  function stopContract()
    external
    onlyOwner
  {
    state = MotionStates.Stopped;
  }

  // Disables circuit breaker enabling all functionality
  function startContract()
    external
    onlyOwner
  {
    state = MotionStates.Started;
  }
}
