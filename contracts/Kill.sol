//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

// selfdestruct
// - delete contract
// - force send Ether to any address

// 通过自毁来强制发送主币的方法
contract Kill {
    constructor() payable {}

    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    function testCall() external pure returns (uint256) {
        return 123;
    }
}

contract Helper {
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    function kill(Kill _kill) external {
        _kill.kill();
    }
}
