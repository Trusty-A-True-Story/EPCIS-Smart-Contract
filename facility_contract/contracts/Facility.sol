pragma solidity >=0.4.22 <0.6.0;

import "./CompanyAccessControl.sol";

contract Facility {
  
  struct Facility {
    string name;
    string facilityId;
    string metadataURI;
    string hashMetadata;
    address companyTrustyIdentifier;
  }

  Facility[] facilities;
  mapping (string => uint256) facilityToId;

  event FacilityCreated(uint _id, string _name, string facilityId, address indexed _companyTrustyIdentifier);

  function createFacility(string memory  name, string memory facilityId, string memory metadataURI, string memory hashMetadata, address companyTrustyIdentifier) public {
    uint256 newFacilityId = facilities.length;
    Facility memory _facility = Facility({
      name: name,
      facilityId: facilityId,
      metadataURI: metadataURI,
      hashMetadata: hashMetadata,
      companyTrustyIdentifier: companyTrustyIdentifier
    });
    facilities.push(_facility);
    facilityToId[facilityId] = newFacilityId;
    emit FacilityCreated(newFacilityId, name, facilityId, companyTrustyIdentifier);
  }

  function getFacilityFromIdentifier(uint id) public view returns (string memory, string memory, string memory, string memory, address)
  {
    return (
      facilities[id].name,
      facilities[id].facilityId,
      facilities[id].metadataURI,
      facilities[id].hashMetadata,
      facilities[id].companyTrustyIdentifier
    );
  }
}