// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint count; 

    function getCount() public view returns(uint){
        return count ++;
    }

    
}