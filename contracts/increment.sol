//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import 'hardhat/console.sol';

contract Increment {
    uint256 public number = 0;
    event IncrementNumber(uint256 num, uint256 result);

    function setNum(uint num) public {
        number = num;
        console.log('number is: %s', number);
    }

    function getNum() public view returns (uint256) {
        return number;
    }

    function increment(uint256 num) public {
        number += num;
        emit IncrementNumber(num, number);
    }
}