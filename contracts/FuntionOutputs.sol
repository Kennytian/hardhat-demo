//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract FunctionOutputs {
    function returnMany() public pure returns (uint256, bool) {
        return (1, true);
    }

    function named() public pure returns (uint256 x, bool b) {
        return (1, true);
    }

    function assigned() public pure returns (uint256 x, bool b) {
        x = 1;
        b = true;
    }

    function destructingAssigment() public pure {
        (uint256 x, bool b) = returnMany();
        // only use variable b
        (, bool b) = returnMany();
    }
}
