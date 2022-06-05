require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.0",
  networks: {
	  rinkeby: {
		  url: 'https://eth-rinkeby.alchemyapi.io/v2/iE5rFcZDGBVKR55-LXgQ53DnXktpYrc0',
		  accounts: ['7bf7033d9242060296e981711ef3ecc58dad6974a385ba2f97fa6063ad3b7fe7'],
	  },
  },
};
