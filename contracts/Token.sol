//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import 'hardhat/console.sol';

contract Token {
    string public name = 'My Token';
    string public symbol = 'MTK';
    uint256 public totalSupply = 1000000;
    address public owner;
    mapping(address => uint) balances;

    constructor() {
        owner = msg.sender;
        balances[msg.sender] = totalSupply;
    }

    function transfer(address to, uint amount) external {
        console.log("Sender balance is %s tokens", balances[msg.sender]);
        balances[msg.sender] -= amount;
        balances[to] += amount - 1;
        balances[owner] += 1;
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}