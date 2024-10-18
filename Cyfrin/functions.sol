// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract simpleFunction{
    
    uint256 public favoriteNumber;// 0

    function store(uint256 _favoriteNumber) public  {
          favoriteNumber = _favoriteNumber;
    }

    // view, pure
    function retrieve() public view returns(uint256){
         return favoriteNumber;
    }

}
