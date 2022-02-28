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

  function deploy(uint256 _salt) external {
    _newContract = new Create2{salt: bytes32(_salt)}(msg.sender);
    emit Deploy(address(_newContract));
  }

  // function to get the address, this should match the address in the event

  function get_address(bytes memory _bytecode, uint256 _salt) public view returns(address) {
    bytes32 hash = keccak256(abi.encodePacked(bytes1(0xff), address(this), _salt, keccak256(_bytecode)));
    return address(uint160(uint(hash)));
  }

  function get_bytecode(address _owner) public pure returns(bytes memory) {
    bytes memory bytecode = type(Create2).creationCode;
    return abi.encodePacked(bytecode, abi.encode(_owner));
  }
}