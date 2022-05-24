//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// 向构造函数里输入参数
//contract U is S('sss'), T('ttt') {
//
//}

contract U is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {
        //
    }
}

contract V is S("sss"), T {
    constructor(string memory _text) T(_text) {
        //
    }
}
