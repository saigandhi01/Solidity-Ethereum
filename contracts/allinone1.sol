pragma solidity ^0.4.0;

contract allinone1 {


//set account public
address public account;

// set description public 
string public description;

// set enabled public
bool public enabled;

// bytes32
bytes32 public name;


// function setaccount input type address
function setAccount(address _account) {
    account = _account;
}

// function set description input type string.
function setDescription (string _description) {
    description = _description;
}

// function set enabled input type bool
function setEnabled(bool _enabled) {
    enabled = _enabled;
}    

// function set name input type bytes32
function setName(bytes32 _name) {
    name = _name;
}

}