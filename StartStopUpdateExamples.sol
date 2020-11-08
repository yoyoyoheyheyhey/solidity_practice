pragma solidity >=0.4.22 <0.7.0;

contract StartStopUpdateExample {
    address owner;
    
    bool public paused;

    constructor() public {
        owner = msg.sender;        
    }

    function sendMoney() public payable {
        
    }
    
    function setPaused(bool _paused) public payable {
        require(msg.sender == owner, "You are not the owner");
        paused = _paused;
    }
    
    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        require(!paused, "Contract is paused");
        _to.transfer(address(this).balance);
    }

    function destroySmartContract(address payable _to) public {
        selfdestruct(_to);
    }
}
