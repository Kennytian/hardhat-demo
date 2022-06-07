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

contract DeployWithCreate2 {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }
}

contract Create2Factory {
    event Deploy(address addr);

    function deploy(uint256 _salt) external {
        DeployWithCreate2 _contract = new DeployWithCreate2{
            salt: bytes32(_salt)
        }(msg.sender);
        emit Deploy(address(_contract));
    }

    function getAddress(bytes memory bytecode, uint256 _salt)
        public
        view
        returns (address)
    {
        bytes32 hash = keccak256(
            abi.encodePacked(
                bytes1(0xff),
                address(this),
                _salt,
                keccak256(bytecode)
            )
        );
        return address(uint160(uint256(hash)));
    }

    function getBytecode(address _owner) public pure returns (bytes memory) {
        bytes memory bytecode = type(DeployWithCreate2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_owner));
    }
}
