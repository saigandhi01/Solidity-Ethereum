pragma solidity ^0.8.0;

contract decision {
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