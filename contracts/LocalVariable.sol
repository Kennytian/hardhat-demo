//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract LocalVariable {
    uint public i;
    bool public b;
    address public myAddress;

    function foo() external {
        uint x = 123;
        bool f = false;

        x += 456;
        f = false;

        i = 123;
        b = true;

        myAddress  = address(1);
    }
}