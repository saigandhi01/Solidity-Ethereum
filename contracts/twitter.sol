// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1️⃣ Create a Twitter Contract 
// 2️⃣ Create a mapping between user and tweet 
// 3️⃣ Add function to create a tweet and save it in mapping
// 4️⃣ Create a function to get Tweet 
// 5️⃣ Add array of tweets 
// Adding structs after Array[], Structs author content timestamp likes

contract Twitter {

    uint16 constant MAX_TWEET_LENGTH = 280;
    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }    
     mapping (address => Tweet[]) public tweets;
    
    function createTweet(string memory _tweet) public  {
        // Conditional
        // if tweet length <= 280 then we are good, otherwise we revert
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is too long bro!");
        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 10
        });
        tweets[msg.sender].push(newTweet);
    }

    function getTweet(address _owner, uint _i) public view returns (Tweet memory) {
        return tweets[_owner][_i];
    }

    function getAllTweet(address _owner) public view returns (Tweet[] memory){
        return tweets[_owner];
    }

}