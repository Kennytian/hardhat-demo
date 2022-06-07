//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract GasGolf {
    // start - 50908 gas
    // use calldata - 49163 gas
    // load state variables to memory - 48952 gas
    // short circuit
    // loop increments
    // cache array length
    // load array elements to memory

    uint256 public total;

    // [1, 2, 3, 4, 5, 100]
    // function sumIfEvenAndLessThan99(uint256[] memory nums) external {
    //     for (uint256 i = 0; i < nums.length; i += 1) {
    //         bool isEven = nums[i] % 2 == 0;
    //         bool isLessThan99 = nums[i] < 99;
    //         if (isEven && isLessThan99) {
    //             total += nums[i];
    //         }
    //     }
    // }

    // v2 -> 49163 gas
    // function sumIfEvenAndLessThan99(uint256[] calldata nums) external {
    //     for (uint256 i = 0; i < nums.length; i += 1) {
    //         bool isEven = nums[i] % 2 == 0;
    //         bool isLessThan99 = nums[i] < 99;
    //         if (isEven && isLessThan99) {
    //             total += nums[i];
    //         }
    //     }
    // }

    // v3 -> 48952 gas
    // function sumIfEvenAndLessThan99(uint256[] calldata nums) external {
    //     uint _total = total;
    //     for (uint256 i = 0; i < nums.length; i += 1) {
    //         bool isEven = nums[i] % 2 == 0;
    //         bool isLessThan99 = nums[i] < 99;
    //         if (isEven && isLessThan99) {
    //             _total += nums[i];
    //         }
    //     }
    //     total = _total;
    // }

    // v4 -> 48634 gas
    // function sumIfEvenAndLessThan99(uint256[] calldata nums) external {
    //     uint256 _total = total;
    //     for (uint256 i = 0; i < nums.length; i += 1) {
    //         if (nums[i] % 2 == 0 && nums[i] < 99) {
    //             _total += nums[i];
    //         }
    //     }
    //     total = _total;
    // }

    // v5 -> 48226 gas
    // function sumIfEvenAndLessThan99(uint256[] calldata nums) external {
    //     uint256 _total = total;
    //     for (uint256 i = 0; i < nums.length; ++i) {
    //         if (nums[i] % 2 == 0 && nums[i] < 99) {
    //             _total += nums[i];
    //         }
    //     }
    //     total = _total;
    // }

    // v6 -> 48029 gas
    function sumIfEvenAndLessThan99(uint256[] calldata nums) external {
        uint256 _total = total;
        uint256 len = nums.length;
        for (uint256 i = 0; i < len; ++i) {
            uint256 num = nums[i];
            if (num % 2 == 0 && num < 99) {
                _total += num;
            }
        }
        total = _total;
    }
}
