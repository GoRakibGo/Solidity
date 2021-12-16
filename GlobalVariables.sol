// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

// global variables

contract GlobalVariables{
    function globalVars() public view returns (address, uint, uint) {
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number;
        return(sender, timestamp, blockNum);
    }
}
