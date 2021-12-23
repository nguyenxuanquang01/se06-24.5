pragma solidity >= 0.7.0 < 0.9.0;
// SPDX-Licence-Identifier: UNLICENSED
contract Practice4{
    address owner;
    address payable private person1; // abf1asfsc651fa6se8f
    address payable private person2; // bdf2s5dfas2d61fd61v
    address payable private person3; // rg2sefsfsg4s6esjtio
    uint256 public balance;
    uint time;
    mapping(address => bool) persons;

    modifier onlyOwner{
        require(msg.sender == owner, "Only can withdraw");
        _;
    }
    modifier checkBalance {
        require (balance > 0, "Not enough money");
        _;
    }

    modifier checkTime {
        require(block.timestamp >= time + 30, "Not enough time");
        _;
    }

    modifier checkRegister (address person){
        if (persons[person]){
            revert("Registed");
        }else{
           _; 
        }
    }

    constructor(){
        owner = msg.sender ;
        time = block.timestamp;
    }

    receive() payable external{
        balance = msg.value;
    }

    function withdraw() public onlyOwner checkBalance {
        time = block.timestamp;
        uint256 amount = balance/4;
        balance = balance - balance/4;
        person1.transfer(amount/6);
        amount = amount - amount/6;
        person2.transfer(amount*3/4);
        amount = amount - amount*3/4;
        person3.transfer(amount);
        amount = 0;
    }

    function register (address person) public onlyOwner checkRegister (person){
        persons[person] = true;
    }
    
    function destroyContract() public onlyOwner {
        selfdestruct(payable(owner));
    }
}