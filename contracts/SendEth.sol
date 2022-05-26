//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

// 3 ways to send ETH
// transfer - 2300 gas, reverts
// send - 2300 gas, returns bool
// call - all gas, returns bool and data

contract SendEther {
    constructor() payable {}

    // fallback() external payable {}
    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        // 只会消耗 2300 个 gas，如果 gas 用完或者对方拒收，就会报错
        // transfer 123 wei
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable {
        // send 123 wei
        bool sent = _to.send(123);
        require(sent, 'send failed');

    }

    function sendViaCall(address payable _to) external payable {
        (bool success, bytes memory data) = _to.call{value : 123}('');
        require(success, 'call failed');
    }
}

contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}