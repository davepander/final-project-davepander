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
   A predefined Meeting Agenda (JSON file) is created and stored on IPFS.

   The BoardChair will call a meeting and will specify the Agenda file IPFS address. This file (small) is read and parsed by the `jsmnsol-lib/JsmnSolLib.sol` contract and creates an array of Motions to consider.
   The board chair now needs request that BoardMembers Join the meeting in order to reach Quarom and iterate throught the motions.

   If enough members are "present,"" there is Quorum, in this case defined as >50% of total boardMembers).

   Once Quorum is attained, any BoardMember can Propose a motion for vote, and any other BoardMember can Second the Motion to trigger an actual Vote.

  Once the Vote is triggered, all BoardMembers vote.

  After the vote(s), the result(s) are recorded, and if no other Motions, the Meeting is Adjourned.

##Assumptions
  For this exercise we are making the following assumptions:
    The Owner of the Board contract is the BoardChair
    The BoardChair authorizes BoardMember addresses (MetaMask and potentially through uPort)
    The Meeting Agenda (JSON file) has already been stored (ideally on IPFS) and is referenced when the meeting is called to order.

##Setup
## Development setup:
Install all dependencies for contract development:
```
npm install
```

Install all dependencies for client development:

```
cd client && npm install
```
Launch the Ganache UI (Preferred)
Ensure the truffle-config.js file updated for proper port 8545 if not pulled from this repository.
```
-	Run Ganache on http://127.0.0.1:8545
```
Metamask Setup
```
-	Install Metamask extension to chrome browser.
-	Copy the Mnemonics of Ganache and login in Metamask.
```    
