// SPDX-License-Identifier: MIT
// https://sepolia.etherscan.io/tx/0xdccad1c5adb5da7d0af6c22eddb073bd8ccc9d9441f557c0c4b280072b5fa7d6
// https://automation.chain.link/new-time-based
pragma solidity ^0.8.0;
contract CounterContract {
    uint public counter = 0;
    function incrementCounter() public {
        counter += 1;
    }
}