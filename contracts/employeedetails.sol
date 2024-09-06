pragma solidity ^0.4.0;


// First we need to create a contract to employees table or data
contract employee{

mapping(uint256 => Data) public EnterEmpID;

struct Data {

uint time;

string Name;

string Role;

uint256 Number;

string Address;

string Gender;

string Email;

uint256 Salary;

uint256 Age;

// Function to SetEmployees Details

}

function setEmployees(uint256 _empidx, string _Name, string _Role, uint256 _Number, string _Address, string _Gender, 
                      string _Email, uint256 _Salary, uint256 _Age) {
 EnterEmpID[_empidx] = Data(now, _Name, _Role, _Number, _Address, _Gender, _Email, _Salary, _Age);

}

}
    

// Empidx   Name    Role           Number         Address      Gender   Email          Salary   Age   
  
// 7745    Sai    Blockchain Dev    6281486623    Hyderabad    Male    sai@gmail.com    600000  24
// 7746    Pardhu Blockchian Dev    6281487723    America      Male    pardhu@gmail.com 900000  26
// 7747    Akash  Orcale SQL Dev    9989606145    Vizag        Male    akash@gmail.com  600000  25
// 7748    Priya  MS SQL Amdmin     8106071634    Bangalore    Female  priya@gmail.com  1000000 30
// 7749    Raj    Salesforce Dev    6301306923    Hyderabad    Male    raj@gmail.com    1500000 27
// 7750    Akansha Human Resource   6301111112    Chennai      Female  akansha@gmail.com 500000 26

