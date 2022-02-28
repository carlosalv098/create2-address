//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Create2 {

  address public immutable owner;

  constructor(address _owner) {
    owner = _owner;
  }
}
