pragma solidity >=0.4.22 <0.6.0;

import "./CompanyAccessControl.sol";

/*
* @title CompanyBase
* @notice This contract defines the Company data structure and how to read from it
*
*/

contract CompanyBase{

  struct Company {
    string companyId;
    string name;
    address companyTrustyIdentifier;
  }

  /**
   * @notice All comapny in existence.
   * @dev The ID of each company is an index in this array.
   */
  Company[] companies;

  event CompanyCreated(string _name, string _companyId, uint trustyId, address indexed companyTrustyIdentifier);

  constructor() public {
    Company memory _company = Company({companyId: "0",name:"GENESIS COMPANY",companyTrustyIdentifier:0x0000000000000000000000000000000000000000});
    uint256 newCompanyId = companies.push(_company) - 1;
  }



  function _createCompany(string _id, string _name, address _companyTrustyIdentifier) public returns (uint) {
    uint trustyId = companies.length;
    Company memory _company = Company({companyId: _id,name:_name, companyTrustyIdentifier:_companyTrustyIdentifier});
    companies.push(_company);
    emit CompanyCreated(_name,_id,trustyId,_companyTrustyIdentifier);
    return trustyId;
  }

  function companyInfo(uint id)
    public view returns (string, string,address)
  {
    return (
      companies[id].name,
      companies[id].companyId,
      companies[id].companyTrustyIdentifier
    );
  }
}