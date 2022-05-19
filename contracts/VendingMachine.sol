//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 定义在 contract 之外，继承的合约也能调用这个 error
error Unauthorized(address caller);

contract VendingMachine {
    address payable owner = payable(msg.sender);

    function withdraw() public {
        if (msg.sender != owner) {
            // 消耗 23642 gas
            // revert("error");
            // 消耗 23678 gas
            revert("error error error error error error error error error error error error ");
        }

        owner.transfer(address(this).balance);
    }

    function withdrawNew() public {
        if (msg.sender != owner) {
            // 只消耗 23388 gas
            revert Unauthorized(msg.sender);
        }

        owner.transfer(address(this).balance);
    }
}