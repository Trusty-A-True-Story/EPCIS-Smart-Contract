pragma solidity >=0.4.22 <0.6.0;

import "./CompanyAccessControl.sol";

contract Product {
  //address internal _owner;

  struct Product {
    string name;
    string productId;
    string metadataURI;
    string hashMetadata;
    address companyTrustyIdentifier;
  }

  Product[] products;

  mapping(string => uint256) productToId;

  event ProductCreated(uint _id, string _name, string productId, address indexed _companyTrustyIdentifier);
  //event CreditNoteUpdate(address indexed _owner,  string _identifier, string _newStatus);

  function createProduct(string memory  name, string memory productId, string memory metadataURI, string memory hashMetadata, address companyTrustyIdentifier) public {
    uint256 newProductId = products.length;
    Product memory _product = Product({
      name: name,
      productId: productId,
      metadataURI: metadataURI,
      hashMetadata: hashMetadata,
      companyTrustyIdentifier: companyTrustyIdentifier
    });
    products.push(_product);
    productToId[productId] = newProductId;
    emit ProductCreated(newProductId, name, productId, companyTrustyIdentifier);
  }

  function getProductFromIdentifier(uint id) public view returns (string memory, string memory, string memory, string memory, address)
  {
    return (
      products[id].name,
      products[id].productId,
      products[id].metadataURI,
      products[id].hashMetadata,
      products[id].companyTrustyIdentifier
    );
  }
}