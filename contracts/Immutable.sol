//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Immutable {
    // 45718 gas
    // address public owner = msg.sender;

    // 43585 gas
    address public immutable owner = msg.sender;

    uint256 public x;

    function foo() external {
        require(msg.sender == owner, "It is not owner");
        x += 1;
    }
}
