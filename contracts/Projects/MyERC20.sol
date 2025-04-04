// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract CTEToken is ERC20 {
    constructor(uint256 initialSupply) 
    ERC20("SILVER", "SLV") {
        _mint(_msgSender(), initialSupply); // Initialize the supply with some tokens.
    }
}