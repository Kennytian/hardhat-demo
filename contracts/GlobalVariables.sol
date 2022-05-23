//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract GlobalVariables {
    // view 会读取一些变量的值
    // 状态变量、全局变量，都可以用 view 来读
    // pure 是不能读取状态变量、全局变量
    function globalVars() external view returns (address, uint, uint) {
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number;
        return (sender, timestamp, blockNum);
    }
}