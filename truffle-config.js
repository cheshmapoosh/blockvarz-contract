const HDWalletProvider = require("@truffle/hdwallet-provider");

const mnemonic = "chase poverty reopen zoo undo market skull enroll hat orient language repeat";

module.exports = {
  networks: {
    // development: {
    //   host: "127.0.0.1",     // Localhost (default: none)
    //   port: 8545,            // Standard Ethereum port (default: none)
    //   network_id: "*",       // Any network (default: none)
    //  },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/2d93974af8ca4f94899db20d9e2e7887")
      },
      network_id: 3
    }
  },
  compilers: {
    solc: {
      version: "0.8.13",      // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      settings: {          // See the solidity docs for advice about optimization and evmVersion
       optimizer: {
         enabled: false,
         runs: 200
       },
       evmVersion: "byzantium"
      }
    }
  },
};
