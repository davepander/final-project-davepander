pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

// @title Meeting Breaker
contract MeetingBreaker is Ownable {
  enum MeetingStates { Started, Stopped }
  MeetingStates public state;

  constructor ()
    public
  {
    state = MeetingStates.Started;
  }

  // Only allow function to be executed with Meeting Contract is in state "Started"
  modifier meetingStarted() {
    require(state == MeetingStates.Started);
    _;
  }

  // Enables circuit breaker stopping all functionality
  function stopContract()
    external
    onlyOwner
  {
    state = MeetingStates.Stopped;
  }

  // Disables circuit breaker enabling all functionality
  function startContract()
    external
    onlyOwner
  {
    state = MeetingStates.Started;
  }
}
