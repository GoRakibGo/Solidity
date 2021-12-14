// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

// safe math
contract SafeMath{
    function testUnderflow() public pure returns(uint){
        uint x = 0;
        x --;
        return x;
    }  // = give an error


    function testUncheckedUnderflow() public pure returns(uint){
        uint x = 0;
        unchecked { x--; }
        return x;
    }
}
