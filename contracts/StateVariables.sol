//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract StateVariable {
    uint public myUnit = 123;

    // external 外部可用
    function foo() external {
        uint noStateVariable = 456;
    }
}