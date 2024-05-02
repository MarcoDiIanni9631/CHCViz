// SPDX-License-Identifier: GPL-3.0-only
pragma solidity >= 0.8.2;
import "./lib/ReentrancyGuard.sol";

/// @custom:version non-reentrant `withdraw` transfers `amount-1` instead of `amount`.
contract DepositEth is ReentrancyGuard {

    uint private sent;
    uint public immutable initial_deposit;

    constructor () payable {
        initial_deposit = address(this).balance;
    }

    function withdraw(uint amount) public nonReentrant {
        /// @custom:preghost function withdraw
        uint prev_sender_balance = address(msg.sender).balance;
        
        require(amount <= address(this).balance - 1);

        sent += amount;

	    (bool succ,) = msg.sender.call{value: amount-1}("");
        require(succ);
        /// @custom:postghost function withdraw
        uint sender_balance = address(msg.sender).balance;	
        assert(sender_balance == prev_sender_balance + amount);
    }

}
