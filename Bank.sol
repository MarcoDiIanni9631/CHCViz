contract Bank {
    mapping (address => uint) balances;
    function deposit() external payable {
        uint user_balance = balances[msg.sender];
        balances[msg.sender] += msg.value;
        uint new_user_balance = balances[msg.sender];
        assert(new_user_balance == user_balance + msg.value);
    }
    function withdraw(uint amount) public {
        require(amount > 0 && amount <= balances[msg.sender]);
        balances[msg.sender] -= amount;
        (bool success,) = msg.sender.call{value: amount}("");
        require(success);
    }
}
