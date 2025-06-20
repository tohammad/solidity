require("@nomicfoundation/hardhat-toolbox");
require('@openzeppelin/hardhat-upgrades')

require('dotenv').config()

module.exports = {
  solidity: "0.8.29",
  networks: {
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${process.env.ALCHEMY_API_KEY}`,
      accounts: [process.env.PRIVATE_KEY], // used for signing my contracts (get it from metamask)
      chainId: 11155111,
    },
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
};
