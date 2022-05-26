//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Payable {
    //address public payable owner;
    //constructor(){
    //   owner = payable(msg.sender);
    //}

    // 标记为 payable 就能接受以太网主币的传入
    function deposit() external payable {}

    function getBalance() external view returns(uint aa) {
        return address(this).balance;
    }
}
