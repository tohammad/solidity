// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract FixedSizeArray {
    // Declare a fixed-size array of uint with length 5
    uint[5] public fixedArray;


    // Function to get the length of the fixed-size array
    function getLength() public view returns (uint) {
        return fixedArray.length;
    }


    // Function to update an element in the fixed-size array
    function updateElement(uint index, uint value) public {
        require(index < fixedArray.length, "Index out of bounds");
        fixedArray[index] = value;
    }

    function getArray() public view  returns(uint[5] memory) {
        return fixedArray;
    }
}
