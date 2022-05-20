//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

// Function modifier - reuse code before and / or after function
// Basic, input, sandwich

contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPause(bool outPause) external {
        paused = outPause;
    }

    modifier whenNotPause() {
        require(!paused, "paused");
        _;
    }

    function inc() external whenNotPause {
        count += 1;
    }

    function dec() external whenNotPause {
        count -= 1;
    }

    modifier cap(uint x) {
        require(x < 100, 'x >= 100');
    }

    function incBy(uint x) external whenNotPause cap(x) {
        count += x;
    }

    modifier sandwich() {
        count += 10;
        _;
        count *= 2;
    }

    // 1. count += 10
    // 2. count += 1
    // 3. count *= 2;
    function foo() external sandwich {
        count += 1;
    }
}