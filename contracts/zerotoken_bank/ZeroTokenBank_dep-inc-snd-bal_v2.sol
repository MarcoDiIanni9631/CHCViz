/// @custom:version does not require withdraw cap.
//SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.8.2;

contract ZeroTokenBank {
    uint contract_balance;
    mapping (address => uint) balances;

    function balanceOf(address addr) public view returns (uint) {
        return balances[addr];
    }

    function totalBalance() public view returns (uint) {
        return contract_balance;
    }

    function deposit(uint amount) public {
        /// @custom:preghost function deposit
        uint currb = balances[msg.sender];
        
        balances[msg.sender] += amount;
        contract_balance += amount;
        /// @custom:postghost function deposit
        uint newb = balances[msg.sender];
        assert(newb == currb + amount);
    }

    function withdraw(uint amount) public {
        require(amount > 0);

        balances[msg.sender] -= amount;

        contract_balance -= amount;
    }
}
