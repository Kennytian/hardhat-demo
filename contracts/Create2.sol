//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract Create2 {
    function getBytes32(uint256 salt) external pure returns (bytes32) {
        return bytes32(salt);
    }

//    function getAddress(bytes32 salt, uint256 arg)
//        external
//        view
//        returns (address)
//    {
//        address addr = address(
//            uint160(
//                uint256(
//                    keccak256(
//                        abi.encodePacked(
//                            bytes1(0xff),
//                            address(this),
//                            salt,
//                            keccak256(
//                                abi.encodePacked(type(D).creationCode, arg)
//                            )
//                        )
//                    )
//                )
//            )
//        );
//        return addr;
//    }
//
//    address public deployedAddr;
//
//    function createDSalted(bytes32 salt, uint256 arg) public {
//        D d = new D{salt: salt}(arg);
//
//        deployedAddr = address(d);
//    }
}
