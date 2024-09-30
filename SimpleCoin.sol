// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ConvertLibV2.sol";

contract SimpleCoin {
    mapping(address => uint) balances;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        balances[msg.sender] = 10000;
    }

    function sendCoin(address receiver, uint amount) public returns (bool sufficient) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Transfer(msg.sender, receiver, amount);
        return true;
    }

    function getBalanceInEth(address addr) public view returns (uint) {
        return ConvertLibV2.convert(getBalance(addr), 2);
    }

    function getBalance(address addr) public view returns (uint) {
        return balances[addr];
    }
}
