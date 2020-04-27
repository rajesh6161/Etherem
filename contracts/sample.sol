pragma solidity ^0.5.2;

contract Sample {
   string public message;

   constructor(string memory initialMsg) public {
     message = initialMsg;
   }

   function setMessage(string memory newMsg) public {
     message = newMsg;
   }
}
