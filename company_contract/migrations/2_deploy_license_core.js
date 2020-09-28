const contracts = artifacts.require("./CompanyBase.sol");
const TruffleConfig = require('../truffle');

module.exports = function(deployer, network) {
  const config = TruffleConfig.networks[network];
  //deployer.deploy(contracts, "A2A Token","A2A",0,100000)
  deployer.deploy(contracts)
  setTimeout(function(){
    console.log('>> Sending Transaction to accelerate contract deploy');
    web3.eth.sendTransaction({from: config.from,to: config.from,value: 0});
  },5000)
};

