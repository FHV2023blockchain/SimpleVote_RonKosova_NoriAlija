# SimpleVote

A smart contract that allows for voting and counting of votes. The voting itself costs 0.01 ETH whereas the counting of votes is free.


## Contract Address

``0xdB7aB0fF8a03f6693c7C5C6f82250C4f150f1bB3``


## Usage

The `vote` method can be called with the name of a candidate to cast a vote. 

```solidity
 function vote(string memory candidate) public payable
```
<br>
The `getVotes` method can be called with the name of a candidate to count the votes for that candidate.

```solidity
function getVotes(string memory candidate) public view returns (uint256)
```

