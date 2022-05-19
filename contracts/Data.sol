//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

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

    address public addr = 0x2424324fafdafdaf2424324fafdaf;
    byte32 public b32 = 0x2342342424324fafdaf2424324fafdaf24243fdaf2424324fafdaf2424324fafdaf;
}