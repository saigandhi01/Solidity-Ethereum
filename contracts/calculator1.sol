// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    
    uint256 result = 0;

    function add(uint256 _num) public  {
        result += _num;
    }

    function sub(uint256 _num) public  {
        result -= _num;
    }

    function mult(uint256 _num) public {
        result *= _num;
    }

    function get() view public returns(uint256){
       return result;

    }
}
