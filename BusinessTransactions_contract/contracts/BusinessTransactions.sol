pragma solidity >=0.4.22 <0.6.0;

contract BusinessTransactions {
    struct PurchaseOrder{
        string OrderId;
        string metadataURI;
        string hashMetadata;
        uint[] products;
        string datetime;
        address Buyer;
    }
    struct DespatchAdvice{
        string OrderId;
        string DespatchAdviceId;
        string metadataURI;
        string hashMetadata;
        uint[] instances;
        string datetime;
        address Seller;
    }
    struct ReceiveAdvice{
        string OrderId;
        string ReceiveAdviceId;
        string metadataURI;
        string hashMetadata;
        uint[] instances;
        string datetime;
        address Buyer;
    }
    
    
    PurchaseOrder[] purchaseOrders;
    DespatchAdvice[] despatchAdvices;
    ReceiveAdvice[] receiveAdvices;
    
    event PurchaseOrderEvents(uint trustyId, uint indexed product, string  OrderId, address indexed buyer);  
    event DespatchAdviceEvents(uint trustyId, uint indexed instances, string OrderId, string DespatchAdviceId, address indexed buyer);  
    event ReceiveAdviceEvents(uint trustyId, uint indexed instances, string OrderId, string DespatchAdviceId, string ReceiveAdviceId, address indexed buyer);  
    
    function PurchaseOrderMethod(string memory OrderId,  address Buyer, string memory metadata, string memory hashMetadata, uint[] memory products, string memory datetime) public {
        uint trustyId = purchaseOrders.length;
        for(uint i = 0; i<products.length; i++){
            emit PurchaseOrderEvents(trustyId, products[i], OrderId, Buyer);
        }
        PurchaseOrder memory _purchaseOrder = PurchaseOrder({
            OrderId:OrderId,
            metadataURI: metadataURI,
            hashMetadata: hashMetadata,
            products:products,
            datetime:datetime,
            Buyer:Buyer
        });
        purchaseOrders.push(_purchaseOrder);
  }
  
  function getPurchaseOrder(uint id) public view returns (string memory,string memory,string memory,uint[] memory,string memory,address){
    return (
      purchaseOrders[id].OrderId,
      purchaseOrders[id].metadataURI,
      purchaseOrders[id].hashMetadata,
      purchaseOrders[id].products,
      purchaseOrders[id].datetime,
      purchaseOrders[id].Buyer
    );
  }

  function DespatchAdviceMethod(string memory OrderId, string memory DespatchAdviceId, address Seller, string memory metadataURI, string memory hashMetadata,  uint[] memory instances, string memory datetime) public {
        uint trustyId = despatchAdvices.length;
        for(uint i = 0; i<instances.length; i++){
            emit DespatchAdviceEvents(trustyId, instances[i], OrderId, DespatchAdviceId, Seller);
        }
        DespatchAdvice memory _despatchAdvice = DespatchAdvice({
            OrderId:OrderId,
            DespatchAdviceId: DespatchAdviceId,
            metadataURI: metadataURI,
            hashMetadata: hashMetadata,
            instances:instances,
            datetime:datetime,
            Seller:Seller
        });
        despatchAdvices.push(_despatchAdvice);
  }
  function getDespatchAdvice(uint id) public view returns (string memory, string memory, string memory, string memory, uint[] memory, string memory, address){
      return (
        despatchAdvices[id].OrderId,
        despatchAdvices[id].DespatchAdviceId,
        despatchAdvices[id].metadataURI,
        despatchAdvices[id].hashMetadata,
        despatchAdvices[id].instances,
        despatchAdvices[id].datetime,
        despatchAdvices[id].Seller
    );
  }
  
  function ReceiveAdviceMethod(address Buyer, string memory OrderId, string memory DespatchAdviceId, string memory ReceiveAdviceId, string memory metadataURI, string memory hashMetadata, uint[] memory instances, string memory datetime) public {
        uint trustyId = receiveAdvices.length;
        for(uint i = 0; i<instances.length; i++){
            emit ReceiveAdviceEvents(trustyId, instances[i], OrderId, DespatchAdviceId, ReceiveAdviceId, Buyer);
        }
        ReceiveAdvice memory _receiveAdvice = ReceiveAdvice({
            OrderId:OrderId,
            ReceiveAdviceId: ReceiveAdviceId,
            metadataURI: metadataURI,
            hashMetadata: hashMetadata,
            instances:instances,
            datetime:datetime,
            Buyer:Buyer
        });
        receiveAdvices.push(_receiveAdvice);
  }
  function getReceiveAdvice(uint id) public view returns (string memory, string memory, string memory, string memory, uint[] memory, string memory, address){
      return (
        receiveAdvices[id].OrderId,
        receiveAdvices[id].ReceiveAdviceId,
        receiveAdvices[id].metadataURI,
        receiveAdvices[id].hashMetadata,
        receiveAdvices[id].instances,
        receiveAdvices[id].datetime,
        receiveAdvices[id].Buyer
    );
  }
}
