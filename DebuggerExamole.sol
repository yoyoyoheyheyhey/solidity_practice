pragma solidity >=0.4.22 <0.7.0;

contract DebuggerExample {
    uint public myUint;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
}
