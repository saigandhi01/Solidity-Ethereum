pragma solidity ^0.5.0;  
   
// Creating a contract 
contract Types {  
  
    // Declaring state variable 
    uint public i; 
    bool public result;

    function Enteravalue(uint _value)public {

        i=_value;

    }
  
    // Defining function to  
    // demonstrate use of  
    // 'if statement' 
    function decision_making( 
    ) public view returns(bool){ 
        if(i<10){ 
            return true; 
            //return result
        } 
    } 

      
}