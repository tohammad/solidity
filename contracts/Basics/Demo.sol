// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Demo {

    uint8 number;

    function getNumber() public view returns (uint8){
        return number;
    }
    function changeNumber(uint8 num) public {
        number = num;
    }
  
}