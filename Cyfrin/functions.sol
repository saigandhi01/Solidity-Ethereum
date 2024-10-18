// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract simpleFunction{
    
    uint256 myFavoriteNumber;// 0

    // uint256[] listOfFavoriteNumbers;
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    Person public pat = Person({favoriteNumber:7, name:"Pat"});

    function store(uint256 _favoriteNumber) public  {
          myFavoriteNumber = _favoriteNumber;
    }

    // view, pure
    function retrieve() public view returns(uint256){
         return myFavoriteNumber;
    }

}
