pragma solidity >=0.4.22 <0.7.0;

contract ExceptionExample {

    mapping(address => uint64) public balanceReceived;
    
    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += uint64(msg.value);
    }

    function withdrawMoneyTo(address payable _to, uint64 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "You don't enough ether!");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= uint64(_amount);
        _to.transfer(_amount);
    }
}
