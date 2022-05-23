//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract Counter {
    // 只有外部才能读取，所以不需要 view 或 pure 关键字
    uint public count = 0;

    //因为是写入方法，所以不需要 view 或 pure 关键字
    function inc() external {
        count += 1;
    }

    // 可视范围是外部可视，合约的内部的其它函数是不能调用的，只能通过外部读取
    function dec() external {
        count -= 1;
    }
}