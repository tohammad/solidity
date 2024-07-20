// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ParentContract {
   
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

contract DerivedContract is ParentContract {
   
    uint num1 = f1();
    //uint num2 = f2(); // not allowed
    uint num3 = f3();
    //uint num4 = f4(); // not allowed
}

contract OtherContract {
   ParentContract obj = new ParentContract();
   uint public f = obj.f1();

}
