// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage{
    uint256 public favoriteNumber;

   
        string public favoriteName;
        address public yourAddress;
        bool  yesOrNo;


    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;

    }

    function store(string memory _favoriteName) public{
        favoriteName = _favoriteName;
    }

    function store(address _yourAddress) public{
        yourAddress = _yourAddress;
    }


}