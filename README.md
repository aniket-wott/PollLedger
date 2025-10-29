
# 🗳️ PollLedger Smart Contract

> A beginner-friendly decentralized polling system built with Solidity.

---

## 📘 Project Description

**PollLedger** is a simple Ethereum smart contract designed to demonstrate how blockchain can be used for fair and transparent voting.  
It allows users to vote for predefined candidates without any external setup or constructor arguments.

This project is great for beginners learning **Solidity**, **Remix IDE**, and the fundamentals of **decentralized applications (dApps)**.

---<img width="1920" height="1080" alt="Screenshot 2025-10-29 140640" src="https://github.com/user-attachments/assets/e8a736b0-700d-42f8-b437-1d5cb1e8db6b" />


## ⚙️ What It Does

PollLedger enables any Ethereum wallet address to:
- Cast one vote for one of the available candidates.
- View the total number of votes each candidate has received.
- Ensure transparency — votes are permanently stored on the blockchain.

---

## ✨ Features

✅ **No Setup Needed** – Deploy instantly without constructor arguments.  
✅ **Predefined Candidates** – Includes three candidates: `Alice`, `Bob`, and `Charlie`.  
✅ **One Vote per Address** – Prevents duplicate voting using the voter's wallet address.  
✅ **Public Vote Count** – Anyone can check the total votes per candidate.  
✅ **Lightweight & Gas-Efficient** – Beginner-friendly code designed for simplicity and clarity.  

---

## 🔗 Deployed Smart Contract

**Network:** Ethereum  
**Contract Address:** [`0x6C425dd9f39252C8EfBb505D62Ed9A21ae788b86`](https://etherscan.io/address/0x6C425dd9f39252C8EfBb505D62Ed9A21ae788b86)

---

## 💻 Smart Contract Code

```solidity
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

