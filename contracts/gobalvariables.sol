// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract GlobalVariables {
    
    address public owner;
    address public Myblockhash;
    uint256 public difficulty;
    uint256 public gasLimit;
    uint256 public number;
    uint256 public timestamp;
    uint256 public value;
    uint256 public nowOn;
    address public origin;
    uint256 public gasprice;
    bytes public callData;
    bytes4 public firstFour;


    constructor() {
        owner = msg.sender;
        // here msg.sender is gobal variable, The one who deployed the contract.
    
    
    
    
    
    }


}
