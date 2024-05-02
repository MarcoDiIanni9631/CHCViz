// SPDX-License-Identifier: GPL-3.0-only
pragma solidity >= 0.8.2;
import "./lib/ReentrancyGuard.sol";

/// @custom:version non-reentrant `withdraw` transfers to `address(0)` instead of `msg.sender`.
contract DepositEth is ReentrancyGuard {

    uint private sent;
    uint public immutable initial_deposit;

    constructor () payable {
        initial_deposit = address(this).balance;
    }

    function withdraw(uint amount) public nonReentrant {
        /// @custom:preghost function withdraw
        uint prev_balance = address(this).balance  ;	
        
        require(amount <= address(this).balance);

        sent += amount;

	    (bool succ,) = address(0).call{value: amount}("");
        require(succ);
        /// @custom:postghost function withdraw
        assert(address(this).balance == prev_balance - amount);
    }

}
