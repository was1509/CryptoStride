// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract MintyourCoins{
    address public minter;
    mapping (address => uint) public balance;
    event send(address from, address to, uint amount);

    // constructor() public{
    //     minter = msg.sender;
    // } 

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balance[receiver] += amount;
    }

    function sent(address receiver, uint amount) public{
        require(amount <= balance[msg.sender], "Insufficient Balance");
        balance[msg.sender] -= amount;
        balance[receiver] += amount;
        emit send(msg.sender, receiver, amount);
    }

    function balances(address _account) external view returns (uint){
        return balance[_account];
    }

}