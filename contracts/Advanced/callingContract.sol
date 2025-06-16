// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Alice {
    uint256 public x;
    uint256 public value;

    function setter(uint256 _x) public {
        x = _x;
    }

    function getter() public view returns (uint256) {
        return x;
    }

    function payableSetter(uint256 _x) public payable {
        x = _x;
        value = msg.value;
    }
}

contract Bob {
    function getStateVar(Alice _aliceAddress) external view returns (uint256) {
        return _aliceAddress.getter();
    }
}
