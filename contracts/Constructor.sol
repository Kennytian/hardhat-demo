//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract Constructor {
    address public owner;
    uint public x;

    // 用结构函数初始化变量的操作
    constructor(uint _x){
        owner = msg.sender;
        x = _x;
    }
}