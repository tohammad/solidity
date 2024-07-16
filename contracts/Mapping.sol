// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MappingExample {
    mapping(uint => string) public studentDetails;
    function insertData (uint key, string memory value) public {
        studentDetails[key] = value;
    }

    function getValue(uint key) public view returns (string memory) {
        return studentDetails[key];
    }
}
