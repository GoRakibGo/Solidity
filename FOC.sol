// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

// function outside contract

function helper(uint x) view returns (uint) {
    return x * 2;
}

contract TestHelper {
    function test () external view returns (uint) {
        return helper(123);
    }
}
