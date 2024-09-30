// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenBaseV2 {
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowances;
    uint public totalSupply;
    address public admin;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        admin = msg.sender;
    }

    function updateAdmin(address newAdmin) external {
        require(msg.sender == admin, "Only admin can update");
        admin = newAdmin;
    }

    function mint(address to, uint amount) external {
        require(msg.sender == admin, "Only admin can mint");
        totalSupply += amount;
        balances[to] += amount;
        emit Transfer(address(0), to, amount);
    }

    function burn(address owner, uint amount) external {
        require(msg.sender == admin, "Only admin can burn");
        require(balances[owner] >= amount, "Insufficient balance");
        balances[owner] -= amount;
        totalSupply -= amount;
        emit Transfer(owner, address(0), amount);
    }

    function transfer(address to, uint amount) public returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function approve(address spender, uint amount) public returns (bool) {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address from, address to, uint amount) public returns (bool) {
        require(balances[from] >= amount, "Insufficient balance");
        require(allowances[from][msg.sender] >= amount, "Allowance exceeded");

        balances[from] -= amount;
        balances[to] += amount;
        allowances[from][msg.sender] -= amount;

        emit Transfer(from, to, amount);
        return true;
    }
}
