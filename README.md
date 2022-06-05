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

```Bash
mkdir <nameOfFolder>
cd <nameOfFolder>
npm init --yes
npm install --save-dev hardhat
```

Then we need ‘contracts’ library from OpenZeppelin,  ether.js (JavaScript library to interact with Ethereum) and Waffle (simple smart contract testing library built on top of ether.js)

```Bash
npm install --save-dev @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers ethers
```

```Bash
npm install @openzeppelin/contracts
```

Run npx (Node.js package execute) to initialize a hardhat project:
```Bash
npx hardhat
// Choose "Create a basic sample project"
// yes/ enter to all prompts
```
![text](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/326348e8-bd2e-479d-b65d-4f1fca4b4d35/Screenshot_2022-01-08_at_19.35.53.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T111828Z&X-Amz-Expires=86400&X-Amz-Signature=175c4fd91e2219e14fe8db6c207513c64ee693ce2c61e4894291733f2f46c353&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-08%2520at%252019.35.53.png%22&x-id=GetObject)

Go ahead and delete the file ’sample-test.js’ under test. Also, delete ’sample-script.js’ under scripts. Then, delete ’Greeter.sol’ under contracts. **Don't delete the actual folders!**

Open VSCode and install the Solidity Language extension:

![VSCode](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/f5e93f89-ecde-4b97-a65f-0726bb0a5c0a/Screenshot_2022-01-08_at_19.39.46.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T112002Z&X-Amz-Expires=86400&X-Amz-Signature=3ce955fa1d98d33fcb17248a63fe93f516134cd486038cc098438c6fee8a94e5&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-08%2520at%252019.39.46.png%22&x-id=GetObject)

touch <filename>.sol under contracts and run.js under scripts
Check the Folder/file structure.

![Structure](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/dbab119b-789e-4773-895a-b9b3dfdd7364/Screenshot_2022-01-08_at_19.47.56.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T112116Z&X-Amz-Expires=86400&X-Amz-Signature=b3cfc229345c745234d9655f27e88cbc356bcea11fa62a7c337ecc00d6c28c05&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-08%2520at%252019.47.56.png%22&x-id=GetObject)

.sol is the actual smart contract, and what really makes an NFT ‘NFT’ is the compliance with the ERC721 standards (want more info? Check this link from OpenZeppelin).
https://docs.openzeppelin.com/contracts/2.x/api/token/erc721
 
```Solidity
  //SPDX Licence-Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

//We inherit the imported Contracts.
contract mutt42 is ERC721URIStorage
{
	//Counters imported for keeping track of TokenIDs.
	//_tokenIds is 'state variable', change is stored on the contract directly.
	using Counters for Counters.Counter;
	Counters.Counter private _tokenIds;

	//Set Name and symbol of our NFT
	constructor() ERC721 ("R.Mutt@Desk0", "Mutt@42Desk0"){
		console.log("Constructor called on mutt42.sol");
	}

	//Function used by the caller to get the NFT
	// Gets the current tokenID (starts at 0 in line 15)
	function buildNFT() public{
		uint256 newId = _tokenIds.current();
		//Mint the NFT to the Sender using msg.sender
		// msg.sender is the public address of the person calling the contract
		_safeMint(msg.sender, newId);

		//Set the NFT data.
		_setTokenURI(newId, "<https://ipfs.io/ipfs/><json_CID_here>");

		//Confirm NFT is minted
		console.log("NFT with id: %s Has been minted to %s", newId, msg.sender);

		//Finally increment the Counter
		_tokenIds.increment();
	}
}
```
Line 1 indicates the Licence: MIT in this case. Check the link below for various versions:

[https://spdx.org/licenses/](https://spdx.org/licenses/)

*pragma* keyword enables compiler features or checks and prevents compatibility issues with feature versions of Solidity. ‘ ^ ’ means “this version or any newer”. Use pragma without ‘ ^ ’ to use specific version only.

Check the hardhat.config.js file! Version of language must be the same!
  
![config](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/2d5315c2-acd3-4376-83d0-a1921fa54674/Screenshot_2022-01-08_at_20.05.32.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T112733Z&X-Amz-Expires=86400&X-Amz-Signature=c9e0204bd8f25fb6bd763db93d52dd79bdaec9025c83322866e8df96ce91d0a2&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-08%2520at%252020.05.32.png%22&x-id=GetObject)

Also useful to note in this file:

url: is the link to Alchemy and in this case is for Rinkeby TestNet. Why use Alchemy? As we are not ‘[node](https://ethereum.org/en/developers/docs/nodes-and-clients/)’ (miners/validators) to broadcast the smart contract to Ethereum Blockchain we need to use an external service. More info:

[https://ethereum.org/en/developers/docs/ethereum-stack/#ethereum-nodes](https://ethereum.org/en/developers/docs/ethereum-stack/#ethereum-nodes)

[https://docs.alchemy.com/alchemy/introduction/getting-started](https://docs.alchemy.com/alchemy/introduction/getting-started)

Make a new Project, change from Mainnet to Rinkeby and copy your key:

![Alchemy](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/7ee65a1e-7bca-4ea4-834c-5c1615873cff/Screenshot_2022-01-09_at_15.32.34.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T112838Z&X-Amz-Expires=86400&X-Amz-Signature=1a865db2640bbaefbe1f88142f25fd0995d88e3fb1399ce42f9834c6fec59ca5&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-09%2520at%252015.32.34.png%22&x-id=GetObject)
  
![Alchemy2](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/740f2a35-b32d-4bba-8cd0-5b869efeea01/Screenshot_2022-01-09_at_15.34.05.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T112923Z&X-Amz-Expires=86400&X-Amz-Signature=2b2358d5240cb8c815259da254229d64a1f1e5760e4cc945d90f663fc595f511&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-09%2520at%252015.34.05.png%22&x-id=GetObject)

*public* function *buildNFT()* can have any name you want, check run.js, name of calling function must be the same.

We take the newId (with *.current*) and we call *_safemint()* with the public address of the wallet of the caller and the id. ) _safemint() reverts if the tokenId is already used.

*_setTokenURI* holds the Metadata of the NFT with the .json file containing the name, description and address of the image.

First we need to save our image. This can be done ‘on-chain’, meaning that we can save the image on Blockchain, but [gas fees](https://ethereum.org/en/developers/docs/gas/) will dramatically increase. Another solution is to save our image for the NFT on the IPFS peer-to-peer hypermedia protocol. Again similarly to Nodes and Alchemy we can use a provider to store in IPFS. We tried with [NFT.Storage](https://nft.storage/) which provides free account. Firstly, you must upload your image and get the Content ID.

Then you create your .json file which contains this CID:
  
```json
  {
	"name": "Mutt@42 <**your title>**",
	"description": "Mutt@42",
	"image": "<https://ipfs.io/ipfs/bafkreiag5zvjutor6oen7uruehkhotcxsmrrn3wofufauk2g2zd3oi7qxe>"
}
  ```
 Remember that the name, description and address (the Metadata of NFT) will be pulled by the Marketplace.

Then you upload the .json file to IPFS with [NFT.Storage](http://nft.storage/) (or any other service you prefer). My ‘Files’ page looks like this:

![IPFS](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a1108922-67f8-4532-83bc-5cc0f4ce696e/Screenshot_2022-01-08_at_21.26.32.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T113055Z&X-Amz-Expires=86400&X-Amz-Signature=e3343270f844869219692ade722b0cade1d388ef83d900da8965744d3debdd16&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-08%2520at%252021.26.32.png%22&x-id=GetObject)
 
then the CID of the json will be imported to _setTokenURI in the form of “https://ipfs.io/ipfs/<CID_here>”);

![setTokenURI](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/7cf95645-1588-41a7-a936-4e1fdced5756/Screenshot_2022-01-08_at_21.32.54.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T113153Z&X-Amz-Expires=86400&X-Amz-Signature=81231904f6703051b49ebd966dd75a7ce0568f46359f9d358e6eac245eefd082&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-08%2520at%252021.32.54.png%22&x-id=GetObject)

Overall : address of the image in the .json and address of the .json in the _*setTokenURI* function.

Lastly (ignoring the printing),  we increment the TokenId.

Lets see now the run.js:

![run](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b8ec6710-2e98-4256-89fc-882dd1888101/Screenshot_2022-01-08_at_21.47.42.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T113306Z&X-Amz-Expires=86400&X-Amz-Signature=d694bf20dfd766cf16a79d4ee80abda234870ece3b87a2f92d98539ac6a05dae&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-08%2520at%252021.47.42.png%22&x-id=GetObject)

```Javascript
  const nftContractFactory = await hre.ethers.getContractFactory('mutt42');
```
Check that the calling contract is the one indicated in .sol
```Solidity
  contract mutt42 is ERC721URIStorage
  ```
  ```Javascript
  await nftContract.deployed();
  ```
  We'll wait until our contract is officially mined and deployed to the blockchain!
Our constructor runs when we actually are fully deployed!
 ```Javascript
  console.log("Contract deployed to:", nftContract.address);
  ```
  
  
  Finally, once it's deployed `nftContract.address` will  basically give us the address of the deployed contract. This address is  how can actually find our contract on the blockchain. Also this address is different from msg.sender, which is the address of the person calling our contract

After the deployment of the Contract we will mint the NFT. Make sure you have the correct function name [ *buildNFT()* in this case ]:

  ```Javascript
  let txn = await nftContract.buildNFT();
```

```Javascript
  const main = async () => {
	const nftContractFactory = await hre.ethers.getContractFactory('mutt42');
	const nftContract = await nftContractFactory.deploy();
	await nftContract.deployed();
	console.log("Contract deployed to:", nftContract.address);


  let txn = await nftContract.buildNFT();
  // Wait for it to be mined.
  await txn.wait()
  console.log("NFT minted successfully.");
};

  const runMain = async () => {
	try {
	  await main();
	  process.exit(0);
	} catch (error) {
	  console.log(error);
	  process.exit(1);
	}
  };

  runMain();
```
### Connecting with OpenSea.

First, we need to connect our Wallet with OpenSea Market:

![Wallet](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b5e5ab6b-1b85-4505-b22e-fa4b06c54a5b/Screenshot_2022-01-08_at_21.54.00.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T113803Z&X-Amz-Expires=86400&X-Amz-Signature=903f07d0544c02f7aebb84df544c0b531c4eeeb294e6921f8cbe4ac9608d52d0&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-08%2520at%252021.54.00.png%22&x-id=GetObject)

Then we need Ether to pay for the deployment of the contract (deployment is actually a transaction we ask miners to do). Thankfully, we can use a testnet to learn and experiment. Here we used Rinkeby. 
You can ask for fake ETH on (https://faucet.rinkeby.io/)
 
![image2](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/8cd01e87-6ece-4460-bc8a-7262b4481ffe/Screenshot_2022-01-08_at_21.59.02.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T114050Z&X-Amz-Expires=86400&X-Amz-Signature=ea0d04a4cef157808322b703203ba9f337411d49c450f086a519e151ed8996cd&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-08%2520at%252021.59.02.png%22&x-id=GetObject)
  
### Lastly on our terminal:
```Bash
  npx hardhat run scripts/run.js --network rinkeby
```
  Note the “Contract deployed to ” output. This is the address that holds the contract, and you can check this transaction on etherscan
 
 ![ether](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/89804c6e-30a7-42a3-b7e0-453d4985f2ca/Screenshot_2022-01-08_at_22.12.57.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T114208Z&X-Amz-Expires=86400&X-Amz-Signature=a186957225272debd92557f497597cce5470955c74500b5434d80b72d202d734&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-08%2520at%252022.12.57.png%22&x-id=GetObject)
  Now our NFT is visible on the Market:
  
  ![Final](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/86b835c7-ee94-4d7f-8a0e-4f7132a6ff83/Screenshot_2022-01-08_at_22.15.12.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220605T114254Z&X-Amz-Expires=86400&X-Amz-Signature=a25f69a52b8e35f3bad7532435777240d6392e2d7f74b7eaebc2db89a10bf956&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Screenshot%25202022-01-08%2520at%252022.15.12.png%22&x-id=GetObject)

## Final Note:

### This Guide is far from complete and certainly not the only way to write a smart contract. Please feel free to send me your thoughts and comments!
  
  
