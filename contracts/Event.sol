//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Event {
    event Log(string message, uint256 val);

    // up to 3 index
    event IndexedLog(address indexed sender, uint256 val);

    // 虽然没有标记为 view，但是一个写入方法
    function example() external {
        emit Log("info", 3);

        emit IndexedLog(msg.sender, 78);
    }

    event Message(address indexed _form, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}
