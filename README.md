# final-project-davepander: Multi-Contract Multi-State Board Meeting dApp
final-project-davepander created by GitHub Classroom

## Scope
This project allows for a decentralized "Board Meeting" to convene in order to record leadership decisions on the blockchain.

A board consists of **Officers** who are authorized to take actions. There are official roles such as Secretary and Treasurer, but for the sake of simplicity we will only have one Office subset, and that is the Chairperson. The Chairperson creates and owns the contract.

General board responsibilities include:
    * Call a Meeting to order
    * Join (or attend) a Meeting
    * Propose Motions for votes (Currently only supports predetermined Agenda items)
    * Second Motion Proposals to trigger a vote
    * Vote on a motion  ( Yea, Nay, Abstain )
    * Adjourn the Meeting

This will provide an immutable and transparent record of board meetings. In this case we are assuming the perspective of an open board. For instance, a non-profit that already shares minutes from the meeting in the interest of transparency. This means that **Constituants** of the board (Share/Stake holders, employees, the public) will be able to review the board votes.

## High level Concepts

  There are three main contracts:
    `Board.sol`, `Meeting.sol`, `Motion.sol`.  The Board will likely persist for the longest amount of time, though the product of the board, outputs from `Meetings` and `Motions` will persist on the blockchain as transaction records.


   What is a Board Meeting? While there are formal rules around meetings, they tend to be guided by **Agenda** These are often predefined outlines of actionable decision topics which would lend themselves well to JSON file or any XML structure. In this case we explore storing the Agenda on IPFS and referencing the Agenda object from a decentralized store. It is important to be able to connect board voting records with the correct Agenda topics / line-items (Motions).

   The BoardChair typically calls a meeting and will specify, with input from the greater board,the Agenda.  This is captured in a JSON file and stored at an IPFS address. At the time of the meeting, this file (ideally small) location is passed into the Meeting Contract to be read and parsed by the `jsmnsol-lib/JsmnSolLib.sol` contract which can create an array of Motions to consider during the duration of the Meeting.

   The board chair now needs request that BoardMembers Join the meeting in order to reach Quarom and iterate through motions by voting decisions.  

   If enough members are "present,"" there is Quorum, in this case defined as >50% of total boardMembers).

   Once Quorum is attained, any BoardMember can Propose a motion for vote, and any other BoardMember can Second the Motion to trigger an actual Vote.

  Once the Vote is triggered, all BoardMembers vote.

  After the vote(s), the result(s) are recorded, and if no other Motions, the Meeting is Adjourned.

## Assumptions
  For this exercise we are making the following assumptions:
    The Owner of the Board contract is the BoardChair
    The BoardChair authorizes BoardMember addresses (MetaMask and potentially through uPort)
    The Meeting Agenda (JSON file) has already been stored (ideally on IPFS) and is referenced when the meeting is called to order.

## Setup
## Development setup:
Install all dependencies for contract development:
```
npm install
npm install truffle
```

Install all dependencies for client development:

```
npm install openzeppelin-solidity
```

```
truffle install jsmnsol-lib
```
  Unfortunately this library needs to be updated to reflect the latest version of Solidity and had require the IPFS JSON parsing code to be redacted.

```
cd client && npm install
```
Launch the Ganache UI (Preferred)
Ensure the truffle-config.js file updated for proper port 8545 if not pulled from this repository.
```
Run Ganache on http://127.0.0.1:8545
```
Metamask Setup
```
Install Metamask extension to chrome browser.
Copy the Mnemonics of Ganache and login in Metamask.
```    
