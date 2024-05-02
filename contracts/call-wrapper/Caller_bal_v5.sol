// SPDX-License-Identifier: GPL-3.0-only
pragma solidity >= 0.8.2;
import "./lib/ReentrancyGuard.sol";

/// @custom:version non-reentrant `callwrap` and additional non-reentrant function `modifystorage`.
contract CallWrapper is ReentrancyGuard {
    uint data;

    function callwrap(address called) public nonReentrant {
        /// @custom:preghost function callwrap
        uint _balance = address(this).balance;
        
        called.call("");
        /// @custom:postghost function callwrap
        assert(_balance == address(this).balance);
    }

    function modifystorage(uint newdata) public nonReentrant {
        data = newdata;
    }

}
