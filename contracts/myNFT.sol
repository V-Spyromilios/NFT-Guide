//SPDX-Licence-Identifier: MIT

pragma solidity ^0.8.0;

//import OpenZeppelin Contracts
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

//We inherit the imported Contracts.
contract myNFT is ERC721URIStorage
{
	//Counters imported for keeping track of TokenIDs.
	//_tokenIds is 'state variable', change is stored on the contract directly.
	using Counters for Counters.Counter;
	Counters.Counter private _tokenIds;

	//Pass name and symbol of our NFT
	constructor() ERC721 ("4T NFT", "4T") {
		console.log("This is 4T NFT!");
	}

	//Function used by the caller to get the NFT
	// Gets the current tokenID (starts at 0 in line 15)
	function makeTheNFT() public {
		uint256 newId = _tokenIds.current();
	

	//Mint the NFT to the Sender using msg.sender
	// msg.sender is the public address of the person calling the contract

	_safeMint(msg.sender, newId);

	//Set the NFT data.That makes the NFT valuable!
	_setTokenURI(newId, "data:application/json;base64,ewogICAgIm5hbWUiOiAiNDIgV29sZnNidXJnIiwKICAgICJkZXNjcmlwdGlvbiI6ICJBbiBORlQgZnJvbSA0MkRhcHBzIGNvbGxlY3Rpb24iLAogICAgImltYWdlIjogImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjRiV3h1Y3owaWFIUjBjRG92TDNkM2R5NTNNeTV2Y21jdk1qQXdNQzl6ZG1jaUlIQnlaWE5sY25abFFYTndaV04wVW1GMGFXODlJbmhOYVc1WlRXbHVJRzFsWlhRaUlIWnBaWGRDYjNnOUlqQWdNQ0F6TlRBZ016VXdJajRLSUNBOGMzUjViR1UrQ2lBZ0lDQXVZbUZ6WlNCN0lHWnBiR3c2SUdKc1lXTnJPeUJtYjI1MExXWmhiV2xzZVRvZ1oybHNiQ0J6WVc1ek95Qm1iMjUwTFhOcGVtVTZJREl3Y0hnN0lIMEtJQ0E4TDNOMGVXeGxQZ29nSUR4eVpXTjBJSGRwWkhSb1BTSXhNREFsSWlCb1pXbG5hSFE5SWpFd01DVWlJR1pwYkd3OUltOXlZVzVuWlNJdlBnb2dJRHgwWlhoMElIZzlJalV3SlNJZ2VUMGlOVEFsSWlCamJHRnpjejBpWW1GelpTSWdaRzl0YVc1aGJuUXRZbUZ6Wld4cGJtVTlJbTFwWkdSc1pTSWdkR1Y0ZEMxaGJtTm9iM0k5SW0xcFpHUnNaU0krTkRKWGIyeG1jMkoxY21jOEwzUmxlSFErQ2p3dmMzWm5QZ289Igp9Cg==");

	//See when the NFT is minted and to who
	console.log("4T NFT with ID: %s has been minted to %s", newId, msg.sender);

	//Increment the Counter of the NFT
	_tokenIds.increment();
	}
}
/**
     * // Safely mints `tokenId` and transfers it to `to`.
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     *
    *function _safeMint(address to, uint256 tokenId) internal virtual {
    *   _safeMint(to, tokenId, "");
    *}
	*/
