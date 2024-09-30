# Cross-Chain Token Bridge

This repository contains a set of Solidity contracts designed to facilitate a cross-chain token bridge. The bridge allows for the minting and burning of tokens across different blockchains, using a straightforward mechanism for verifying transactions.

## Table of Contents

- [Overview](#overview)
- [Contracts](#contracts)
- [How to Deploy](#how-to-deploy)
- [Usage](#usage)
- [License](#license)

## Overview

The Cross-Chain Token Bridge consists of the following main components:

- **BridgeBaseV2**: The base contract for the bridge, which handles the minting and burning of tokens.
- **BridgeBscV2**: A specific implementation of the bridge for the Binance Smart Chain (BSC).
- **BridgeEthV2**: A specific implementation of the bridge for the Ethereum blockchain.
- **TokenBaseV2**: A base contract for creating mintable and burnable tokens.
- **TokenBscV2**: A token contract for the Binance Smart Chain.
- **TokenEthV2**: A token contract for the Ethereum blockchain.
- **ConvertLibV2**: A library for converting amounts between different units.

## Contracts

### `BridgeBaseV2.sol`

This contract serves as the foundation for the cross-chain bridge, allowing users to burn tokens on one chain and mint them on another.

### `BridgeBscV2.sol`

This contract inherits from `BridgeBaseV2` and is tailored for use on the Binance Smart Chain.

### `BridgeEthV2.sol`

This contract also inherits from `BridgeBaseV2` and is tailored for use on the Ethereum blockchain.

### `TokenBaseV2.sol`

A base ERC20-like token contract that supports minting and burning.

### `TokenBscV2.sol`

A token contract specifically designed for the Binance Smart Chain.

### `TokenEthV2.sol`

A token contract specifically designed for the Ethereum blockchain.

### `ConvertLibV2.sol`

A utility library for converting token amounts based on a conversion rate.

## How to Deploy

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new file for each contract and copy the corresponding code into the file.
3. Compile the contracts using the Solidity compiler.
4. Deploy the `TokenBscV2` or `TokenEthV2` contract first to create your token.
5. Deploy the corresponding `BridgeBscV2` or `BridgeEthV2` contract, providing the address of the token contract as a parameter.
6. Follow the instructions in the contracts to interact with them.

## Usage

- **Burning Tokens**: To burn tokens and initiate a transfer across the bridge, call the `burn` function from the `BridgeBscV2` or `BridgeEthV2` contracts.
- **Minting Tokens**: After the burn transaction is verified, call the `mint` function to mint tokens on the target blockchain.
- **Checking Balances**: Use the `getBalance` function in the `TokenBaseV2` contract to check balances of any address.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
