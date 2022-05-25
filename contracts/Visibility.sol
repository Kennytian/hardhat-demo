//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

// visibility
// private -> only inside contract
// internal -> only inside contract and child contracts
// public -> inside and outside contract
// external -> only from outside contract

contract VisibilityBase {
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;

    function privateFunc() private pure returns (uint) {
        return 0;
    }

    function internalFunc() internal pure returns (uint) {
        return 100;
    }

    function publicFunc() public pure returns (uint) {
        return 200;
    }

    // 只有调用者才能访问，但可以通用 this.xx 访问到，但会浪费 gas
    function externalFunc() external pure returns (uint){
        return 300;
    }

    function examples() external view {
        uint sum = x + y + z;
        privateFunc();
        internalFunc();
        publicFunc();

        // 加 this 会浪费 gas
        this.externalFunc();
    }
}

contract VisibilityChild is VisibilityBase {
    function examples2() external view {
        // y 是内部变量，可以访问
        // z 是公开变量，也可以访问
        uint sum = y + z;
        internalFunc();
        publicFunc();

        // 只能在调用时访问
        //externalFunc()
    }
}