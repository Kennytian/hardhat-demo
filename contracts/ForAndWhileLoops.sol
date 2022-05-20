//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract ForAndWhileLoops {
    function loops() external pure {
        for (uint i = 0; i < 10; i ++) {
            // code
            if (i < 10) {
                continue;
            }
            if (i == 20) {
                break;
            }
        }

        uint j = 0;
        while (j < 10) {
            if (j >= 10) {
                break;
            }
            j++;
        }
    }

    function sum(uint n) external pure returns (uint) {
        uint s;
        for (uint i = 1; i <= n; i ++) {
            s += i;
        }
        return s;
    }
}
