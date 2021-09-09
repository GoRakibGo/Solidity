pragma solidity ^0.8.7;

contract MyFirstContract {
    uint256 number = 0;
    string [] names;
    mapping (string => uint) public phoneNumebrs;
    
    function addMobileNumber (string memory _name, uint _mobileNumber) public {
        phoneNumebrs[_name] = _mobileNumber;
    }
    
    function getMobileNumber (string memory _name) public view returns (uint) {
        return phoneNumebrs[_name];
    }
    
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