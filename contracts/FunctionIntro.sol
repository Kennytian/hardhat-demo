//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract FunctionIntro {
    // external 表示外部函数，只能在外部读取
    // pure 表示是一个纯函数，不对链上数据进行读写操作
    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

    function sub(uint x, uint y) external pure returns (uint) {
        return x - y;
    }
}