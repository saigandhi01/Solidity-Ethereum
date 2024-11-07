// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract simpleFunction{
    
    uint256 myFavoriteNumber;// 0

    // uint256[] listOfFavoriteNumbers;
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    // Person public pat = Person({favoriteNumber:7, name:"Pat"});

    //dynamic array
    Person[] public listOfPeople; //[]

    //static array
    //Person[3] public listOfPeople;
 
    function store(uint256 _favoriteNumber) public  {
          myFavoriteNumber = _favoriteNumber;
    }

    // view, pure
    function retrieve() public view returns(uint256){
         return myFavoriteNumber;
    }
    // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
    }

}
