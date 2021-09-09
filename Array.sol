pragma solidity ^0.8.7;

contract MyFirstContract {
    uint256 number = 0;
    string [] names;
    
    function addName (string memory _name) public {
        names.push(_name);
    }
    
    function getName (uint _index) public view returns (string memory) {
        return names[_index];
    }
    
    function changeNumber (uint256 _num) public {
        number = _num;
    }
    
    function getNumber() public view returns (uint256){
        return number;
    }
}
