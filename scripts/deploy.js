const main = async () => {
	const nftContractFactory = await hre.ethers.getContractFactory('myNFT');
	const nftContract = await nftContractFactory.deploy();
	await nftContract.deployed();
	console.log("Contract deployed to: ", nftContract.address);

	//Call the function
	let txn = await nftContract.makeTheNFT();

	//Wait for the contract to be minted
	await txn.wait();
	console.log("NFT #1 minted successfully.");

	//Mint another NFT for fun :)
	txn = await nftContract.makeTheNFT();

	//Wait for minting
	await txn.wait();
	console.log("NFT #2 minted successfully.")
};

const runMain = async () => {
	try {
		await main();
		process.exit(0);
	}   catch (error) {
		console.log(error);
		process.exit(1);
	}
};

runMain();