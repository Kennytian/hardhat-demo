//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract DataLocations {
    struct MyStruct {
        uint256 foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples(uint256[] calldata y, string calldata z) external returns (uint256[] memory) {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "hello";

        // 在内存中数据，只在局部有效，并且不会更改链上的数据
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;

        _internal(y);

        uint256[] memory memArr = new uint256[](3);
        memArr[0] = 342;
        return memArr;
    }

    function _internal(uint256[] calldata y) private pure {
        uint256 x = y[0];
    }
}
