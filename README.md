# GS1 EPCIS Smart Contracts

## Abstract

***GS1 EPCIS Smart Contracts*** use several resources to store and serve companies and products information. The graph below represents the data model structure:

The platforms use the following resources:

- ***Companies***;
- ***Facilities***;
- ***Products***;
- ***Events***;
- ***Lots***;

Several identifiers (EPCIS Standards) link information together in the supply-chain. EPCIS is a GS1 standard that enables trading partners to share information about the physical movement and status of products as they travel throughout the supply-chain - from business to business and ultimately to consumers. The standard helps to answer the *“what, where, when and why”* question to meet consumer and regulatory demands for accurate and detailed product information. GS1 provides a method for registering identifiers for companies, facilities (or locations) and products. Each registered identifier is a unique ID (UUID) that can be used on any supply-chain, worldwide. If a company don’t use GS1 standard, The Smart Contract provides freely unique identifiers for companies, facilities and products.

Trusty identifies companies, facilities and products. The list below explains the GS1 acronyms for identifiers:

- ***GS1 Company Prefix***: Global Company Identifier associated with a company;
- ***GLN:*** Global Location Number associated with facilities and location (example Businesses, warehouses or retail);
- ***GTIN:*** Global Trade Item Number. Products and services (example Oil, Wine and Cheese);

In ***EPCIS Smart Contracts***, we identify three kinds of products:

- ***Raw Materials:*** The primary products from which intermediate good and finished product are made;
- ***Intermediate Goods:*** Companies use this kind of product to create finished goods;
- ***Finished Goods:*** The product that is sold by the companies;

Using EPCIS standard companies trace supply-chain events that describe products and facilities transparently, covering the requirements of international standards.

Smart Contract uses 4 EPCIS events:

- ***Commission Event:*** It describes a new product instance being created, such as harvested grapes, creates a new instance (lot) of vines. When new raw materials or semifinished goods entered for the first time in the supply-chain companies can use commission event.
- ***Observation Event:*** It describes an event that happens in the supply-chain but does not change the status of the product. For example, a batch of grapes is observed during an inspection of the product. If the check does not create, destroy, transform the vines, this is an observation event.
- ***Shipping Event:*** It describes an event that moves an instance of product from one facility to another. For example, a batch of grapes moved from the farm to the processing plant;
- ***Transformation Event:*** It describes an irreversible process on a product (or a mix of products) to create a new product. For example, processing plants pressing grapes to obtain juice.

Smart Contracts introduce also three Business Transaction:

- ***Purchase Order:*** Describes a specific trade item transaction. This event is generally created by the buyer of the food product, and includes the following data:
    - Buyer Identifier;
    - Receiving Facility (GLN);
    - Trade Items GTINs;
- ***Despatch Advice:*** Describes that the trade item is being sent. Despatch Advice data is generally created by the shipper of the food product, and includes:
    - Shipper GLN;
    - Receiver GLN;
    - Shipping Facility GLN;
    - Receiving Facility GLN;
    - Trade Item GTINs and quantities;
    - Purchase Order Identifiers;
- ***Receive Advice:*** This event describes the trade items received and their condition. Receive Advice Data is generally uploaded by the receiver of the food product, and includes the following data point:
    - Shipper GLN;
    - Receiver GLN;
    - Shipping Facility GLN;
    - Receiving Facility GLN;
    - Trade Item GTINs and quantities;
    - Condition of received trade items;
    - Purchase Order Identifiers;
    - Despatch Advice Identifiers

In the next section we explain Smart Contract Interface. We describe it from the Users point of view. Users are employees of companies that produce food.

## Smart Contracts Description

We have implemented GS1 EPCIS with five separated smart contracts:

- ***Company Contract:*** Let Users handle Company Registrations and GS1 number association.
- ***Facility Contract:*** Let Users handle facilities, description, photos.
- ***Product Contract:*** Let Users handle products, description, photos.
- ***Instance Contract:*** Let Users handle instances and data related to traceability.
- ***Business Transactions Contract:*** Let Users handle business transactions.

For each contract below we introduce the methods by which users can interact.

### Company Contract

Below the methods made available by the smart-contracts:

- ***Create Company:*** It accepts an *identifiers,* a *name* and an *address.* The method register company on-chain.
- ***Company Info:*** It accepts an identifier and it returns name, company identifier and address company identifier.

### Facility Contract

Below the methods made available by the smart-contracts:

- ***Create Facility:*** It accepts **a *name* a *facility identifier,* an URI that returns the facility information, hash of the metadata and the address of the company that owns the facility*.* The method register facility on-chain.
- ***Get Facility From Identifier:*** It accepts an identifier and it returns name, facility identifier, metadata URI, metadata hash and address company identifier.

### Product Contract

Below the methods made available by the smart-contracts:

- ***Create Product:*** It accepts **a *name* a product *identifier,* an URI that returns the facility information, hash of the metadata and the address of the company that owns the product*.* The method register products on-chain.
- ***Get Product From Identifier:*** It accepts an identifier and it returns name, product identifier, metadata URI, metadata hash and address company identifier.

### Instance Contract

Below the methods made available by the smart-contracts:

- ***Create Instance:*** It accepts **event identifier*,* instance identifier*,* product identifier*,* an URI that returns the instance information, hash of the metadata, date and time of the event, facility of the event and the address of the company that makes the event*.* The method register products on-chain.
- ***Get Instance From Identifier:*** It accepts an identifier and it returns all the information associated to instance.
- ***Create Observation Event: It*** accepts **event identifier*,* instance identifier, date and time of the event, facility of the event and the address of the company that makes the event*.* The method register events on-chain.
- ***Create Transformation Event:** It *****accepts **event identifier*,* instance identifier, date and time of the event, facility of the event and the address of the company that makes the event*.* The method register events on-chain.
- ***Get Event From Identifier:*** It accepts an identifier and it returns all the information associated to event.

## Future Implementations

- Implements Eternal Storage to avoid data losses when an update is implemented