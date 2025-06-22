// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract CounterContract {
    uint public counter = 0;
    function incrementCounter() public {
        counter += 1;
    }
}