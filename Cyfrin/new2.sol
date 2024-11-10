// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// name,number,add,

contract SimpleStorage {
      
    string public enterYourName ;
    uint256 public enterYourNumber;
    address public enterYourWalletAddress;

    // functions

    function enterName(string memory _enterYourName) public {
        enterYourName = _enterYourName;

    }

    function enterNumber(uint256 _enterYourNumber) public {
        enterYourNumber = _enterYourNumber;
    }

    function enterWalletAddress(address _enterYourWalletAddress) public {
        enterYourWalletAddress = _enterYourWalletAddress;
    }

}
