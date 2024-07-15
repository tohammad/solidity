// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Conditional {
    int256 public n = 10;

    function conditionalRequire(int256 num) public returns (string memory) {
        // num = 15;    
        require(num > 0, "num should be greater then zero"); // transaction is reverted to the initial state. (failed)
        n = num;
        return "state variable updated";
    }
     function conditionalIf(int256 num) public returns (string memory) {
        if(num > 0) {
            n = num;
            return "state variable updated";
        } else {
            return "num should be greater then zero";
        }
    }
}
