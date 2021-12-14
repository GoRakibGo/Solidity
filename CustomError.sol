// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

// custom error

contract VendingMachine{
    address payable owner = payable(msg.sender);

    error Unauthorized(address caller);

    function withdraw() public {
        if (msg.sender != owner)
        //revert("error");  // = cost more gas
        revert Unauthorized(msg.sender); // = cost less gas


        owner.transfer(address(this).balance);
    }
}
