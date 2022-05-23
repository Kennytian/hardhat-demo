//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

// Date Types - values and references

contract ValueType {
    bool public b = true;

    // uint:
    // uint256 -> 0 ~ 2 ** 256 - 1
    // uint8 -> 0 ~ 2 ** 8 - 1
    // uint16 -> 0 ~ 2 ** 16 - 1
    uint public u = 123;


    // int:
    // int256 -> -2 ** 255 ~ 2 ** 255 - 1
    // int128 -> -2 ** 127 ~ 2 ** 127 - 1
    int public i = - 123;
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0x7Fdd8eF338A3BD437EbCCCb33f44728Fc4252735;
//    byte32 public b32 = 0xe19ff1a867d158e92e82203f518fa055d7fe4f65fe47a7253908c996a9ec6235;
    bytes32 constant statictext1 = "Hello";
}