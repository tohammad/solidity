// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract NestedMappingExample {
    mapping(uint => mapping(uint => bool)) public studentDetails;
    function insertData (uint row, uint col, bool value) public {
        studentDetails[row][col] = value;
    }

    function getValue(uint row, uint col) public view returns (bool) {
        return studentDetails[row][col];
    }
}
