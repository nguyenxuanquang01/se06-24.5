pragma solidity >= 0.7.0 < 0.9.0;
// SPDX-Licence-Identifier: UNLICENSED
contract Practice1{
    address owner;
    address payable person1; // abf1asfsc651fa6se8f
    address payable person2; // bdf2s5dfas2d61fd61v
    address payable person3; // rg2sefsfsg4s6esjtio
    uint256 public balance;
    
    constructor(){
        owner = msg.sender;
    }

    receive() payable external{
        balance = msg.value;
        require(balance > 0, "not money");
        person1.transfer(balance/3);
        balance = balance - balance/3;
        person2.transfer(balance/3);
        balance = balance - balance/3;
        person3.transfer(balance);
        balance = 0;
    }
    
}