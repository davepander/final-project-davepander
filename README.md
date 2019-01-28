# final-project-davepander
final-project-davepander created by GitHub Classroom

##Scope
This project aims to create a contract that allows for a "Board Meeting" to take place and be recorded on the blockchain.

A board consists of officers who are authorized to take actions that include, in the context of this project:
    Calling a Meeting to order
    Join (or attending) a Meeting
    Proposing Motions
    Seconding Motions
    Voting on a motion: Yea, Nay, Abstain
    Adjourning a Meeting

##Scenario
For this final project exercise we will focus on the following tasks.
  For a predefined Meeting Agenda (JSON file) stored via IPFS, the BoardChair will call a meeting to order and request that BoardMembers Join the meeting.  If enough members are present, there is Quorum.  (In this case defined as >50% of total boardMembers).

  Once Quorum is attained, any BoardMember can Propose a motion for vote, and any other BoardMember can Second the Motion to trigger an actual Vote.

  Once the Vote is triggered, all BoardMembers vote.

  After the vote(s), the result(s) are recorded, and if no other Motions, the Meeting is Adjourned.

##Assumptions
  For this exercise we are making the following assumptions:
    The Owner of the Board contract is the BoardChair
    The BoardChair authorizes BoardMember addresses (MetaMask and potentially through uPort)

    The Meeting Agenda (JSON file) has already been stored (ideally on IPFS) and is referenced when the meeting is called to order.
