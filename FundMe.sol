//SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract FundMe {
    
    using SafeMathChainlink for uint256;
    
    
    mapping(address => uint256) public addresstoAmountFunded;
    address[] public funders;
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function fund() public payable {
        // $50
        uint256 minimumUSD = 50 * 10 ** 18;
        require(getConversionRate(msg.value) >= minimumUSD, "You need to spend more ETH!");
        addresstoAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
        // what is the ETH -> USD convesion rate 
    }
    
    function getVersion() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
        return priceFeed.version();
    }
    
    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
        (   ,
            int256 answer,
            ,
            ,
        ) = priceFeed.latestRoundData();
        return uint256(answer * 10000000000);
    }
    
    //1000000000
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountUsd = (ethPrice * ethAmount) / 1000000000000000000;
        return ethAmountUsd;
        //0.000002927540000000
    }
    
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    
    function withdraw() payable onlyOwner public {
        msg.sender.transfer(address(this).balance);
        
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addresstoAmountFunded[funder] = 0;
        }
        funders = new address[](0);
    }
} 