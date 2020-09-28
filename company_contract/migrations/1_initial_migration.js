//USE IT FOR MAINNET AND OFFICIAL TESTNET
/*var Migrations = artifacts.require("./Migrations.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};*/

//USE IT FOR APIO PRIVATE NETWORK
const Web3 = require('web3');

const TruffleConfig = require('../truffle');

var Migrations = artifacts.require("./Migrations.sol");


module.exports = function (deployer, network, addresses) {
  const config = TruffleConfig.networks[network];

  const web3 = new Web3(new Web3.providers.HttpProvider('http://' + config.host + ':' + config.port));

  console.log('>> Unlocking account 0x1a2f03e56f99c5433eeff1b0c5f511ea3c58c54d');
  web3.personal.unlockAccount(config.from, config.passphrase, 36000);

  console.log('>> Deploying migration');
  deployer.deploy(Migrations);
  setTimeout(function(){
    console.log('>> Sending Transaction to accelerate migration');
    web3.eth.sendTransaction({from: config.from,to: config.from,value: 0});
  },5000)
};
