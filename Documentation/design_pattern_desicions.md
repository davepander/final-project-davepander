
# Multiple design patterns were taken into consideration.

The overriding design principle (that led to complexity) was the **Mutli-Contract Multi-State** framework.  Within that there were additional design patterns considered:

## Not used:
Because this contract does not deal with custody or payments, patterns such as **Pull Payment** were not considered.

## Used:
That said, ownership of the Board is an important factor for this dApp, and therefor **Ownership Pattern** was used throughout to ensure that critical contract methods are only executable by the owner. In addition the **Action Restriction** pattern was also implemented to ensure that only board members are allowed to interact with functions to which they are entitled access.  Non-board members and/or entitled constituents (potentially delineated by ERC20 Token ownership) will be able to view meetings, but not impact votes or how the meeting progresses.

The Board itself can exist, and cease to exist, so a **Mortal Pattern** was implemented to allow the owner to kill or dissolve the board. This functionality will be wrapped in a further function that includes board consent.

If we assume that the Board will want to continue to exist The **State Machine Pattern** becomes critical for Meeting and Motion contracts. These contracts have temporal or temporary states that synchronize with real-world board meetings. When the board instantiates (or calls) a Meeting, that Contract goes through various states.  Within the Active Meeting state are one or more motions, that also have their own State.
