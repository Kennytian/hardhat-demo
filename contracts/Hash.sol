//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract HashFunc {
    // hash 值是一个定长的 byte32 的返回值
    function hash(string memory text, uint256 num, address addr) external pure returns (bytes32) {
        // hash 算法里的特定函数
        return keccak256(abi.encodePacked(text, num, addr));
    }

    function encode(string memory text0, string memory text1) external pure returns (bytes memory) {
        return abi.encode(text0, text1);
    }

    function encodePacked(string memory text0, string memory text1) external pure returns (bytes memory) {
        return abi.encodePacked(text0, text1);
    }

    function collision(string memory text0, string memory text1) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text0, text1));
    }

    function collisionV2(string memory text0, uint num, string memory text1) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text0, num, text1));
    }
}
