// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableExample {
    // Event to log when Ether is received
    event Received(address sender, uint amount);

    // Event to log when Ether is withdrawn
    event Withdrawn(address to, uint amount);

    // Function to receive Ether. It is marked as `payable` to allow the contract to accept Ether.
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // Fallback function in case someone sends Ether without calling a function. It is also marked as `payable`.
    fallback() external payable {
        emit Received(msg.sender, msg.value);
    }

    // Function to withdraw the balance of Ether from the contract
    function withdraw(uint _amount) public {
        require(_amount <= address(this).balance, "Insufficient balance in the contract");

        // Transfer the specified amount of Ether to the sender
        payable(msg.sender).transfer(_amount);

        emit Withdrawn(msg.sender, _amount);
    }

    // Function to check the contract's balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
