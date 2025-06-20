
# Proxy Contract Deployment with OpenZeppelin, Hardhat, and Alchemy

This guide will walk you through deploying a proxy contract using OpenZeppelin's upgradeable contract framework with Hardhat on the Ethereum Sepolia network. We will use Alchemy for connecting to the network.

# Upgrading smart contracts
https://docs.openzeppelin.com/learn/upgrading-smart-contracts

# Hardhat
https://hardhat.org/hardhat-runner/docs/getting-started#overview

# Sepolia (blockchain test network)
https://sepolia.etherscan.io/

# Alchemy (mediator between me and blockchain)
https://dashboard.alchemy.com/apps


# Steps
1. npm init
2. npm install --save-dev hardhat ()
3. npx hardhat init
4. npm install --save-dev @openzeppelin/hardhat-upgrades
5. npm install dotenv

## Prerequisites

Ensure you have the following installed:

- [Node.js](https://nodejs.org/)
- [npm](https://www.npmjs.com/)
- [Hardhat](https://hardhat.org/)
- An [Alchemy](https://www.alchemy.com/) account and API key
- An Ethereum wallet and private key (e.g., MetaMask)
- An [Etherscan](https://etherscan.io/) API key for contract verification

## Project Setup

1. **Initialize Your Project**

   ```bash
   mkdir my-upgradeable-contract
   cd my-upgradeable-contract
   npm install
   ```
2. **Create the `.env` File**

   Create a file named `.env` in the root of your project and add the following content:

   ```plaintext
   ALCHEMY_API_KEY=your-alchemy-api-key
   PRIVATE_KEY=your-ethereum-wallet-private-key
   ETHERSCAN_API_KEY=your-etherscan-api-key
   ```

   Replace the placeholders with your actual keys.

## Deployment Steps

1. **Deploy the Initial Version**

   Run the following command to deploy the initial version of your contract:

   ```bash
   npx hardhat run --network sepolia ./scripts/deploy_box_v1.js
   ```

   After running this script, note the contract addresses from the output.

2. **Verify the Contract on Etherscan**

   Verify the proxy contract on Etherscan with:

   ```bash
   npx hardhat verify --network sepolia <YOUR_CONTRACT_ADDRESS>
   ```

3. **Upgrade to the New Version**

   To upgrade to the new version of your contract, run:

   ```bash
   npx hardhat run --network sepolia ./scripts/upgrade_box_v2.js
   ```

<!-- 
Proxy contract address: 0x1645Af30432262b6CFee7e52155411f4c7D3cC62
Implementation contract address: 0x26f6b3fAfF07622068451b170E518c2e020fd369
Upgraded implementation address: 0xC56872614D76272ac35E61f8872F87550312c339
Admin contract address: 0x7755a3Ea10e984554eF6a651F93253627103ECb2 

-->