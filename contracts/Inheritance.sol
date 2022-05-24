//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract BaseContract {
    function foo() public pure virtual returns (string memory) {
        return "foo";
    }

    function bar() public pure virtual returns (string memory) {
        return "bar";
    }

    function baz() public pure returns (string memory) {
        return "baz";
    }
}

contract OrderContract is BaseContract {
    function foo() public pure override returns (string memory) {
        return "FOO";
    }

    function bar() public pure override returns (string memory) {
        return "BAR";
    }
}
