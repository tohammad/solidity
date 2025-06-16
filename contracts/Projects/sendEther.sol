// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyContract  {
   function sendEther(address payable recipient) public payable returns (bool) {  
    bool sent = recipient.send(msg.value);
    return sent;
   }

   function callEther(address payable recipient) public payable returns (bool, bytes memory) {  
    (bool success, bytes memory data) = recipient.call{value: msg.value}("");
    return (success, data);
   }
}