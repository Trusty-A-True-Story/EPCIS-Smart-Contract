let secrets = require('./secret.js');
const WalletProvider = require("truffle-wallet-provider");
const Wallet = require('ethereumjs-wallet');
let mainNetPrivateKey = new Buffer(secrets.mainnetPK, "hex");
let mainNetWallet = Wallet.fromPrivateKey(mainNetPrivateKey);
let mainNetProvider = new WalletProvider(mainNetWallet, "https://mainnet.infura.io/");
let ropstenPrivateKey = new Buffer(secrets.ropstenPK, "hex");
let ropstenWallet = Wallet.fromPrivateKey(ropstenPrivateKey);
let ropstenProvider = new WalletProvider(ropstenWallet, "https://ropsten.infura.io/");
module.exports = {
  networks: {
    development: {
      host: "localhost", port: 7545,
      network_id: "*", gas: 4465030
    },
    ropsten: {
      provider: ropstenProvider,
      network_id: "3", gas: 8000000
    },
    live: {
      provider: mainNetProvider,
      network_id: "1", gas: 7500000
    },
    apio_private: {
      host: "80.211.42.62", //nodeA
      port: 22000,
      network_id: "*",
      gasPrice: 0,
      gas: 4500000,
      type: "quorum",
      from: "0x01e1d68c26f52fe75d21c3672162feaaabde8f88",
      passphrase: "skate1"
    }
  }
};
