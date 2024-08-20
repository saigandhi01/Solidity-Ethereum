// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LoopExample {
    // Declare an array of unsigned integers
    uint[] public numbers;

    // Function to add numbers to the array
    function addNumber(uint _number) public {
        numbers.push(_number);
    }

    // Function to sum all elements in the array using a for loop
    function sumArray() public view returns (uint) {
        uint sum = 0;
        
        // Use a for loop to iterate through the array
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }

        return sum;
    }
    
    // Function to remove all elements from the array using a while loop
    function clearArray() public {
        while (numbers.length > 0) {
            numbers.pop();
        }
    }
}
