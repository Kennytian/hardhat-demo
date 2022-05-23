//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract TestContract {
    uint256 private value;

    constructor(uint256 _value) {
        value = _value;
    }

    function setValue(uint256 _value) public {
        value = _value;
    }
}
