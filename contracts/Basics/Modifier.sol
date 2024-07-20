// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Modifier {
    modifier onlyTrue() {
        require(false == true, "false is not true");
        _; // result will be added here in place of _ if condition passes
    }

    function check1() public pure onlyTrue returns (uint256) {
        //require(false == true, "false is not true");
        return 1;
    }

    function check2() public pure onlyTrue returns (uint256) {
        //require(false == true, "false is not true");
        return 2;
    }

    function check3() public pure onlyTrue returns (uint256) {
        //require(false == true, "false is not true");
        return 3;
    }
}
