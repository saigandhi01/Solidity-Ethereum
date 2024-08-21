// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    // Address of the owner of the contract
    address public owner;

    // Constructor that sets the owner of the contract
    constructor() {
        owner = msg.sender;
    }

    // Payable function to receive Ether
    function deposit() public payable {
        // The Ether sent to this function will be added to the contract's balance
    }

    // Function to withdraw all Ether in the contract to the owner's address
    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }

    // Function to check the balance of the contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
