// SPDX-License-Identifier: MIT
pragma solidity >= 0.4.22 < 0.9.0;


contract Birthcertificate {
   address public doctor;
   uint ID = 0;

   constructor() public {
      doctor = msg.sender;
   }

   modifier onlydoctor(address _doctor){
      require(doctor==_doctor, "Only the admistering doctor on duty can register this new birth certificate");
   _;
   }
   
   struct details {
      string firstname;
      string lastname;
      string DOB;
      string regcenter;
      string fathername;
      string mothername;
      string state;
   }


   mapping(uint => details) human;

   event certificateadded ( string _firstname,
                              string _lastname,
                              string  _DOB,
                              string  _regcenter,
                              string _fathername,
                              string  _mothername,
                              string  _state);

   function addcertificate(string memory _firstname,
                           string memory _lastname,
                           string memory _DOB,
                           string memory _regcenter,
                           string memory _fathername,
                           string memory _mothername,
                           string memory _state) public onlydoctor(msg.sender) {

      human[ID] = details(_firstname, _lastname, _DOB, _regcenter, _fathername, _mothername, _state);
      ID++;

      emit certificateadded (_firstname, _lastname, _DOB, _regcenter, _fathername, _mothername, _state);
   }

}