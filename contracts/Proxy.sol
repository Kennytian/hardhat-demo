//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract TestContract1 {
    address public owner = msg.sender;

    function setOwner(address _owner) public {
        require(msg.sender == owner, "Not owner");
        owner = _owner;
    }
}

contract TestContract2 {
    address public owner = msg.sender;
    uint256 public value = msg.value;
    uint256 public x;
    uint256 public y;

    constructor(uint256 _x, uint256 _y) payable {
        x = _x;
        y = _y;
    }
}

contract Proxy {
    event Deploy(address);

    function deploy(bytes memory code) external payable returns (address addr) {
        assembly {
        // create(v, p, n);
        // v = amount of ETH to send
        // p = pointer in memory to start of code
        // n = size of code
            addr := create(callvalue(), add(code, 0x20), mload(code))
        }
        require(addr != address(0), "Invalid address, deploy failed!");

        emit Deploy(addr);
    }

    function execute(address _target, bytes memory _data) external payable {
        (bool success,) = _target.call{value : msg.value}(_data);
        require(success, "Execute failed");
    }
}

contract Helper {
    function getByteCode1() external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }

    function getByteCode2(uint256 _x, uint256 _y) external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }

    function getCallDate(address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }
}
