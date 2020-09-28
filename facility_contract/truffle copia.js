// Allows us to use ES6 in our migrations and tests.
require('babel-register')
require('babel-polyfill')

const HDWalletProvider = require("truffle-hdwallet-provider-privkey");
const privateKeys =  ["7B64D74EB69F5B4744257BCE770EE57E928725C9958D73ACD80E54CD7ACF0E47"]
var mnemonic = "latino ottobre rantolare mummia sgrassato sfida ibernato allagato arnese greca sfilato tolto sportivo desumere ombra"
let ropstenProvider, mainNetProvider;

module.exports = {
  networks: {
    ropsten: { provider: ropstenProvider, 
                   network_id: "3", gas: 4465030 },
    mainnet: { provider: mainNetProvider, 
                   network_id: "1", gas: 7500000 }
    development: {
        host: '127.0.0.1',
        port: 7545,
        network_id: '*', // Match any network id
    }
},
};
