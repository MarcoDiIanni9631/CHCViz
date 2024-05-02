//SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.8.2;

/// @custom:version conformant to specification
contract Bank {
    mapping (address => uint) balances;

    function deposit() public payable {
        /// @custom:preghost function deposit
        // msg.value is already added to the contract balance upon call
        uint old_contract_balance = address(this).balance - msg.value;
        
        balances[msg.sender] += msg.value;
        /// @custom:postghost function deposit
        uint new_contract_balance = address(this).balance;
        assert(new_contract_balance == old_contract_balance + msg.value);
    }

    function withdraw(uint amount) public {
        require(amount > 0);
        require(amount <= balances[msg.sender]);

        balances[msg.sender] -= amount;

        (bool success,) = msg.sender.call{value: amount}("");
        require(success);
    }
}

