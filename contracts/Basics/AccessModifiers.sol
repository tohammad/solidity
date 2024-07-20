// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract AccessModifiers {
   
    function f1() public pure returns (uint256) {
        return 1;
    }
    function f2() private pure returns (uint256) {
        return 2;
    }
    function f3() internal pure returns (uint256) {
        return 3;
    }
    function f4() external pure returns (uint256) {
        return 4;
    }
}
