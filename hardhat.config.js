require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: {
    version: "0.8.20",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1 // This is a standard value; adjust as needed for your use case
      }
    }
  },
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545/" // URL of the local Hardhat node
      // You can add other options here, like chainId, accounts, etc., if needed.
    }
  }
};
