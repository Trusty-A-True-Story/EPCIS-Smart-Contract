pragma solidity >=0.4.22 <0.6.0;

contract Instance {
  struct product{
    string OrdineProduzione;
    string epc;
  }

  Product[] products;

  event SoGu050(string organization, string supplier, string indexed NumeroVerbale, string datetime, string Ordine, string NumeroCartellino, string hashMetadata, string metadataURI);
  event SoTa050(string  instanceId, uint indexed trustyInstanceId, string datetime, string facilityId, string business_event, address indexed _companyTrustyIdentifier);  
  event SoTa080(uint eventTrustyId, string eventId, string instanceId, string datetime, string facilityId, string business_event, string metadataURI, string metadataHash, address indexed _companyTrustyIdentifier);
  event SoCa030(uint eventTrustyId, string eventId, string instanceId, string datetime, string facilityId, string business_event, string metadataURI, string metadataHash, address indexed _companyTrustyIdentifier);
  event SoCa050(uint eventTrustyId, string eventId, string instanceId, string datetime, string facilityId, string business_event, string metadataURI, string metadataHash, address indexed _companyTrustyIdentifier);
  
  function createInstance(string memory eventId, string memory instanceId, string memory productId, string memory metadataURI, string memory hashMetadata, string memory datetime, string memory facilityId, string memory business_event, address  _companyTrustyIdentifier) public {
    uint256 newInstanceId = instances.length;
    
    Event memory _event = Event({
      eventType: "commission",
      datetime: datetime,
      eventId: eventId,
      facilityId: facilityId,
      instanceId: instanceId
    });
    events.push(_event);

    emit CommissionEvents(instanceId, newInstanceId, datetime, facilityId, business_event, _companyTrustyIdentifier);
    Instance memory _instance = Instance({
      instanceId: instanceId,
      productId: productId,
      metadataURI: metadataURI,
      hashMetadata: hashMetadata,
      companyTrustyIdentifier: _companyTrustyIdentifier
    });
    instances.push(_instance);
  }
  
  function getInstanceFromId(uint id)
  public view returns (string memory,string memory,string memory, string memory,address){
    return (
      instances[id].instanceId,
      instances[id].productId,
      instances[id].metadataURI,
      instances[id].hashMetadata,
      instances[id].companyTrustyIdentifier
    );
  }
  function createObservationEvent(string memory eventId, string memory instanceId, string memory datetime, string memory facilityId, string memory business_event, string memory metadataURI, string memory metadataHash, address _companyTrustyIdentifier) public {
    uint256 newInstanceId = events.length;
    Event memory _event = Event({
      eventType: "observation",
      datetime: datetime,
      eventId: eventId,
      facilityId: facilityId,
      instanceId: instanceId
    });
    events.push(_event);
    emit ObservationEvent(newInstanceId, eventId, instanceId, datetime, facilityId, business_event, metadataURI, metadataHash, _companyTrustyIdentifier);
  }

  
  function TransformationMethod(string memory eventId, uint[] input, uint[] output, string memory facilityId, string memory datetime, string memory business_event, string memory metadataURI, string memory metadataHash, address companyTrustyIdentifier) public {
    uint transformationId = transformations.length;
    Transformation memory _transformation = Transformation({
      transformationId : transformationId,
      input: input,
      output: output,
      facilityId: facilityId,
      datetime: datetime,
      business_event: business_event,
      metadataURI: metadataURI,
      hashMetadata: metadataHash,
      companyTrustyIdentifier: companyTrustyIdentifier
    });
    transformations.push(_transformation);
    for(uint i = 0; i < input.length; i++){
      emit TransformationSupportEvents("input", input[i], transformationId, facilityId, datetime, business_event, companyTrustyIdentifier);
    }
    //Output Support Event
    for(uint x = 0; x < output.length; x++){
      emit TransformationSupportEvents("output", output[x], transformationId, facilityId, datetime, business_event, companyTrustyIdentifier);
    }
  }

  function getTransformationFromId(uint id)
  public view returns ( uint[], uint[], string, string, address){
    return (
      transformations[id].input,
      transformations[id].output,
      transformations[id].metadataURI,
      transformations[id].hashMetadata,
      transformations[id].companyTrustyIdentifier
    );
  }
}