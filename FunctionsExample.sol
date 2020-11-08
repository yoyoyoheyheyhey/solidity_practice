pragma solidity >=0.4.22 <0.7.0;

contract FunctionsExample {

    mapping(address => uint) public balanceReceived;
    
    address payable owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function destroySmartContract() public {
        require(owner == msg.sender, "You are not the owner");
        selfdestruct(owner);
    }
    
    function getOwner() public view returns(address) {
        return owner;
    }
    
    function convertWeiToEther(uint _amountInWei) public pure returns(uint) {
        return _amountInWei / 1 ether;
    }
    
    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoneyTo(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "You don't enough ether!");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    
    function () external payable {
        receiveMoney();
    }
}
