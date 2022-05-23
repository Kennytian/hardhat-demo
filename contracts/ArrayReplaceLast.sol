//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

// This method can be save gas fee, but will be resort array item order
contract ArrayReplaceLast {
    uint[] public arr;

    // [1, 2, 3, 4] -> remove(1) -> [1, 4, 3]
    // [1, 4, 3] -> remove(2) -> [1, 4]
    function remove(uint _index) public {
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        assert(arr.length == 4);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 5);
        assert(arr[3] == 4);
    }
}