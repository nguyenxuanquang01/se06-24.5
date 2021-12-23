pragma solidity >= 0.7.0 < 0.9.0;
// SPDX-Licence-Identifier: UNLICENSED
contract Practice3{
    address owner;
    address payable private person1; // abf1asfsc651fa6se8f
    address payable private person2; // bdf2s5dfas2d61fd61v
    address payable private person3; // rg2sefsfsg4s6esjtio
    uint256 public balance;
    uint time;

    constructor(){
        owner = msg.sender;
        time = block.timestamp;
    }

    receive() payable external{
        balance = msg.value;
    }

    function withdraw() public{
        require(block.timestamp >= time + 30, "Not enough time");
        require(balance > 0, "Not money");
        require(msg.sender == owner,"not owner");
        time = block.timestamp;
        uint256 amount = balance/4;
        balance = balance - balance/4;
        person1.transfer(amount/3);
        amount = amount - amount/3;
        person2.transfer(amount/2);
        amount = amount - amount/2;
        person3.transfer(amount);
        amount = 0;
    }
    
}