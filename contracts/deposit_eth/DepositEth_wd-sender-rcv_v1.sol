// SPDX-License-Identifier: GPL-3.0-only
pragma solidity >= 0.8.2;

/// @custom:version reentrant `withdraw`.
contract DepositEth {

    uint private sent;
    uint public immutable initial_deposit;

    constructor () payable {
        initial_deposit = address(this).balance;
    }

    function withdraw(uint amount) public {
        /// @custom:preghost function withdraw
        uint prev_sender_balance = address(msg.sender).balance;
        
        require(amount <= address(this).balance);

        sent += amount;

        (bool succ,) = msg.sender.call{value: amount}("");
        require(succ);	
        /// @custom:postghost function withdraw
        uint sender_balance = address(msg.sender).balance;	
        assert(sender_balance == prev_sender_balance + amount);
    }
}
