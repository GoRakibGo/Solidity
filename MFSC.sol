pragma solidity ^0.8.7;

contract MyFirstContract {
    uint number;
    function changeNumber(uint256 _num) public {
        number = _num;
    }
    function getNumber() public view returns (uint256) {
        return number;
    }
    
}