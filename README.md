# Quick Guide on NFTs

## Abstract

In the context of the Mutt@42 Art Challenge we decided to extend and use the challenge to learn about and create our own NFTs. Below you can find a Step by Step guide on how to mint your Mutt@42 NFT on the test environment of OpenSea (NFT Marketplace). We are looking into minting NFTs and offering them on a libertarian marketplace that does not charge service fees. We will update this post when we are ready.

Also Evangelos is planning to offer a How to session - we will share the community meeting.

**NOTE**: all NFTs minted in the Mutt@42 Challenge should be named “Mutt@42 **your title**”

## 1. Installing npm & hardhat

The bigger picture here is:

1 -- We're going to write a smart contract. That contract complies with the “[ERC721](https://eips.ethereum.org/EIPS/eip-721)” standard and has all the logic around our NFTs.

2 -- Our smart contract will be deployed to the Testnet named Rinkeby of [Ethereum blockchain](https://ethereum.org/en/). This way, anyone in the world will be able to access and buy our NFT.

We're going to be using a tool called Hardhat which let us quickly compile smart contracts and test them locally. Is built on top of Node.js. follow this guide (Linux, Mac, Windows) for installing Node:

[Ethereum development environment for professionals by Nomic Labs](https://hardhat.org/tutorial/setting-up-the-environment.html)

Then, we can install hardhat with npm (Node.js Package Manager):
