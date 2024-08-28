pragma solidity ^0.8.0;

contract GlobalVariables {
    function getBlockInfo() public view returns (uint, uint, address) {
        return (block.number, block.timestamp, block.coinbase);
    }
    
    function getTransactionInfo() public view returns (address, uint) {
        return (msg.sender, msg.value);
    }
}
