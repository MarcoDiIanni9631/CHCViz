//SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.8.2;

/// @custom:version conformant to specification
contract Bank {
    mapping (address => uint) balances;

    function deposit() public payable {
        /// @custom:preghost function deposit
        uint old_user_balance = balances[msg.sender];
        
        balances[msg.sender] += msg.value;
        /// @custom:postghost function deposit
        uint new_user_balance = balances[msg.sender];
        assert(new_user_balance == old_user_balance + msg.value);
    }

    function withdraw(uint amount) public {
        require(amount > 0);
        require(amount <= balances[msg.sender]);

        balances[msg.sender] -= amount;

        (bool success,) = msg.sender.call{value: amount}("");
        require(success);
    }
}

