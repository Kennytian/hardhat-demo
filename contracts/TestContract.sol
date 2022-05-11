//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "hardhat/console.sol";

contract TestContract {
    uint256 private value;

    constructor(uint256 _value) {
        console.log("Deploying a TestContract with setValue:", _value);
        value = _value;
    }

    function setValue(uint256 _value) public {
        console.log("Changing greeting from '%s' to '%s'", value, _value);
        value = _value;
    }
}
