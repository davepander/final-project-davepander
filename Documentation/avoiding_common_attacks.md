# Common Attacks

This dApp is not focused on value transfer and/or monetary exchange. Therefor the attack vectors are reduced.

## Role Protection

- Ownership of the Board is restricted to the Chairperson
- Ownership is further enforced through OpenZeppelin Ownable libraries
- BoardMembers can be verified (eventually through uPort)

## Overflow Protection
Loops and incremental functions are avoided, so overflow protection was not needed at this point.

## ReEntrancy
Care has been taken, and implementing OpenZeppelin Reentrancy Guard in combination with ownership controls will limit the risks.

## Timestamp
The contracts are meant to be executed at "human" speeds so race situations are a low priority. We are realying on the transaction records on the blockchain to cover relevant real-world timestamp inquiries.

#DOS
If there are DOS attacks, Breaker Circuits for the Meeting and Motion (the most time sensitive relative to the Board contract) are in place.  These Circuits are under the contrl of the Chairperson (and are implemented with the OpenZeppelin Ownable contract).
