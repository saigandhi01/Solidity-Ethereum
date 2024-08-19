// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // Define an enum for the candidates
    enum Candidate { Alice, Bob, Charlie }

    // Declare a mapping to store votes for each candidate
    mapping(Candidate => uint) public votes;

    // Function to vote for a candidate
    function vote(Candidate _candidate) public {
        // Increment the vote count for the selected candidate
        votes[_candidate]++;
    }

    // Function to get the number of votes for a specific candidate
    function getVotes(Candidate _candidate) public view returns (uint) {
        return votes[_candidate];
    }

    // Function to get the winning candidate
    function getWinner() public view returns (Candidate) {
        if (votes[Candidate.Alice] > votes[Candidate.Bob] && votes[Candidate.Alice] > votes[Candidate.Charlie]) {
            return Candidate.Alice;
        } else if (votes[Candidate.Bob] > votes[Candidate.Alice] && votes[Candidate.Bob] > votes[Candidate.Charlie]) {
            return Candidate.Bob;
        } else {
            return Candidate.Charlie;
        }
    }
}
