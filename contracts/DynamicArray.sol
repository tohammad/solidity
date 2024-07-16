// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract DynamicSizeArray {
    // Declare a dynamic-size array of uint
    uint[] public dynamicArray;


    // Function to add an element to the dynamic-size array
    function addElement(uint value) public {
        dynamicArray.push(value);
    }


    // Function to get the length of the dynamic-size array
    function getLength() public view returns (uint) {
        return dynamicArray.length;
    }


    // Function to remove the last element from the dynamic-size array
    function removeLastElement() public {
        require(dynamicArray.length > 0, "Array is already empty");
        dynamicArray.pop();
    }
}

