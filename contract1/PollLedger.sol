// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PollLedger {

    // Fixed candidate list (no arguments needed)
    string[3] public candidates = ["Alice", "Bob", "Charlie"];

    // Mapping to store votes for each candidate
    mapping(string => uint256) private votes;

    // Mapping to track if an address has voted
    mapping(address => bool) public hasVoted;

    // Function to vote for a candidate
    function vote(string memory _candidate) public {
        require(!hasVoted[msg.sender], "You have already voted!");
        require(validCandidate(_candidate), "Invalid candidate!");

        votes[_candidate] += 1;
        hasVoted[msg.sender] = true;
    }

    // Function to check vote count for a candidate
    function votecount(string memory _candidate) public view returns (uint256) {
        require(validCandidate(_candidate), "Invalid candidate!");
        return votes[_candidate];
    }

    // Helper function to check if candidate exists
    function validCandidate(string memory _candidate) private view returns (bool) {
        for (uint256 i = 0; i < candidates.length; i++) {
            if (
                keccak256(abi.encodePacked(candidates[i])) ==
                keccak256(abi.encodePacked(_candidate))
            ) {
                return true;
            }
        }
        return false;
    }
}
