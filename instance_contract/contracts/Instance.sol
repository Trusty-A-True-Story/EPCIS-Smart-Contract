pragma solidity >=0.4.22 <0.6.0;

contract Instance {
  struct instance{
    string instanceId;
    string productId;
    string metadataURI;
    string hashMetadata;
    address companyTrustyIdentifier;
  }

  struct Event{
    string eventType;
    string datetime;
    string eventId;
    string facilityId;
    string instanceId;
  }

  Instance[] instances;
  Event[] events; 



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

    //emit CommissionEvents(instanceId, newInstanceId, datetime, facilityId, business_event, _companyTrustyIdentifier);
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
    //emit ObservationEvent(newInstanceId, eventId, instanceId, datetime, facilityId, business_event, metadataURI, metadataHash, _companyTrustyIdentifier);
  }

  
  function TransformationMethod(string memory eventId, uint[] input, uint[] output, string memory facilityId, string memory datetime, string memory business_event, string memory metadataURI, string memory metadataHash, address companyTrustyIdentifier) public {
    //Input Events
    for(uint i = 0; i < input.length; i++){
      //emit TransformationSupportEvents("input", input[i], transformationId, facilityId, datetime, business_event, companyTrustyIdentifier);
      Event memory _event = Event({
        eventType: "transformation_input",
        datetime: datetime,
        eventId: eventId,
        facilityId: facilityId,
        instanceId: input[i]
      });
      events.push(_event);
    }
    //Output Events
    for(uint x = 0; x < output.length; x++){
      //emit TransformationSupportEvents("output", output[x], transformationId, facilityId, datetime, business_event, companyTrustyIdentifier);
      Event memory _event = Event({
        eventType: "transformation_output",
        datetime: datetime,
        eventId: eventId,
        facilityId: facilityId,
        instanceId: output[i]
      });
      events.push(_event);
    }
  }

  function getEvent(uint id)
  public view returns ( string, string, string, string, string){
    return (
      events[id].eventType,
      events[id].datetime,
      events[id].eventId,
      events[id].facilityId,
      events[id].instanceId
    );
  }
}