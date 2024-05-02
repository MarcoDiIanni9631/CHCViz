//SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.8.2;

/// @custom:version no `amount <= balances[msg.sender]` check and `balances[msg.sender]` is decremented by `amount - 1` in `withdraw()`
contract Bank {
    mapping (address => uint) balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        require(amount > 0);
        //require(amount <= balances[msg.sender]);

        balances[msg.sender] -= amount - 1;

        (bool success,) = msg.sender.call{value: amount}("");
        require(success);
    }

    function invariant(uint choice, uint u1, address a) public payable {
        uint currb = balances[a];
        if (choice == 0) {
            deposit();
        } else if (choice == 1) {
            withdraw(u1);
        } else {
            require(false);
        }
        uint newb = balances[a];
    
        require(newb < currb);
        assert(choice == 1);
        assert(msg.sender == a);
    }

}
