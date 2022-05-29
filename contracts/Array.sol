//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Array {
    uint256[] public nums = [1, 2, 3];
    uint256[3] public   numsFixed = [4, 5, 6];

    function examples() external {
        nums.push(4); // 1, 2, 3, 4
        uint256 x = nums[2]; // x = 3
        nums[1] = 22; // 1, 22, 3, 4
        delete nums[0]; // 0, 1, 22 , 3, 4
        nums.pop(); // 0, 1, 22 , 3
        uint256 len = nums.length; // 3

        uint256[] memory a = new uint256[](5);
        a[0] = 3;
        a[1] = 1;
    }

    function returnArray() external view returns (uint256[] memory) {
        return nums;
    }
}
