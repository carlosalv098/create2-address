//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Create2 {

  address public immutable owner;

  constructor(address _owner) {
    owner = _owner;
  }
}

contract Create2Factory {

  event Deploy(address _addr);

  Create2 public _newContract;

  function deploy(uint _salt) external {
    _newContract = new Create2{salt: bytes32(_salt)}(msg.sender);
    emit Deploy(address(_newContract));
  }
}