//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

// functions outside contract

function doubleNum(uint x) view returns (uint) {
  return x * 2;
}

contract TestHelper {
  function test() external view returns (uint) {
    return doubleNum(4);
  }
}