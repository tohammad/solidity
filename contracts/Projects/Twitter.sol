// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Twitter {

    struct Tweet {
        uint id;
        address author;
        string content;
        uint createdAt;
    }

     struct Message {
        uint id;
        address to;
        address from;
        string content;
        uint createdAt;
    }

    mapping(uint=> Tweet ) public tweets;
    mapping(address=> uint[] ) public tweetsOf;
    mapping(address=> Message[] ) public conversations;
    mapping(address=> mapping(address => bool )) public operators;
    mapping(address=> address[] ) public followers;

    uint nextId;
    uint nextMessageId;


    function tweet(address _from, string memory _content ) public  {
        tweets[nextId] = Tweet(nextId, _from, _content, block.timestamp);
        nextId = nextId + 1;
    }

    function sendMessage(address _from, address _to, string memory _content) public {
         conversations[_from].push(Message(nextMessageId, _to, _from, _content, block.timestamp));
         nextMessageId = nextMessageId + 1;
    }

}