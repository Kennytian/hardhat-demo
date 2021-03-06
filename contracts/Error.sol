//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

// require, revert, assert
contract Error {
    function testRequire(uint i) public pure {
        require(i <= 10, 'error: i > 10');
        // more code here
    }

    function testRevert(uint i) public pure {
        if (i > 10) {
            revert('error: i > 10');
        }
        // more code here
    }

    uint public number = 234;

    function testAssert(uint i) public view {
        assert(number == i);
    }

    function foo(uint i) public {
        number += 1;
        // if here condition is true, will be return gas fee
        require(i < 10, 'error: i >= 10');
    }

    error MyError(address caller, uint i);
    function testCustomError(uint i) public view {
        // require(i <= 10, "very long long long long long error message");
        if(i> 10){
            revert MyError(msg.sender, i);
        }
    }
}