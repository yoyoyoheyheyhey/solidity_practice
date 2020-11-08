pragma solidity >=0.4.22 <0.7.0;

contract Owned {
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "You are not allowed");
        _;
    }
}
