//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

/*
fallback() or receive()?

    Ether is sent to contract
                |
         is msg.data empty?
               / \
             yes  no
             /     \
receive() exists?   fallback()
           / \
         yes  no
         /     \
    receive() fallback()
*/

contract Fallback {
    event Log(string func, address sender, uint256 value, bytes data);

    // 外部可用
    // 可接受主币的发送
    fallback() external payable {
        emit Log("Fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("Receive", msg.sender, msg.value, '');
    }
}
