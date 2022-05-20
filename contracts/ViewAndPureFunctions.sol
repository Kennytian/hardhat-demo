//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract ViewAndPureFunctions {
    uint public num;
    // view 会读写链上信息
    function viewFunc() external view returns(uint) {
        return num;
    }

    // pure 不会读链上信息
    function pureFunc() external pure returns(uint) {
        return 1;
    }

    function addToNum(uint x) external view returns(uint) {
        return x + num;
    }

    function add(uint x, uint y) external pure returns(uint){
        return x + y;
    }
}