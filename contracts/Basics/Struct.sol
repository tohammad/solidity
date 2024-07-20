// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Classroom {
    struct Student {
        string name;
        uint256 roll;
        bool pass;
    }

    Student public s1;

    function insert() public returns (Student memory) {
        s1.name = "Hammad";
        s1.roll = 7;
        s1.pass = true;
        return s1;
    }

    function insert2() public returns (Student memory) {
        s1 = Student("Hammad", 7, true);
        return s1;
    }
}
