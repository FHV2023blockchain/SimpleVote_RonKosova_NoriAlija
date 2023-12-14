

// contract HelloWorld {
//   string public message;

//   constructor(string memory init_message) {
//     message = init_message;
//   }

//   function sayMessage() public view returns (string memory) {
//     return message;
//   }

//   function setMessage(string memory new_m) payable external {
//     require(msg.value > 0.01 ether);
//     message = new_m;
//   }
// }
// // hello_instance.methods.setMessage('nonono').send({from: '0x0885b44b64f377f83AD66e461361Df765C4C2496', value:web3.utils.toWei('1.015')})

// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SimpleVote {
    // Define candidates and their vote counts
    mapping(string => uint256) public candidateVotes;

    mapping(address => bool) public hasVoted;
    mapping(address => uint256) public voterPayments;


    // Event to log each vote
    event Voted(address indexed voter, string candidate, uint256 amountPaid);

    // Function to vote for a candidate
    function vote(string memory candidate) public payable {
        // Ensure the voter hasn't voted before
        require(!hasVoted[msg.sender], "You have already voted.");

        // Ensure the sent amount is at least 0.01 ETH
        require(msg.value >= 0.01 ether, "Insufficient funds to vote.");

        // Increase the vote count for the selected candidate
        candidateVotes[candidate]++;

        // Mark the voter as having voted
        hasVoted[msg.sender] = true;

        // Record the amount paid by the voter
        voterPayments[msg.sender] = msg.value;

        // Emit the Voted event
        emit Voted(msg.sender, candidate, msg.value);
    }

    // Function to get the vote count for a candidate
    function getVotes(string memory candidate) public view returns (uint256) {
        return candidateVotes[candidate];
    }
}