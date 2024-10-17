/*Task:
Create a contract for Fractional NFT in the ERC-404 network in polygon.
Single NFT minting and sale in ERC 721.
Single NFT buy using ERC721.
Minting and open to sale Fractional NFT.
Fractional buy NFT using ERC404.
Do this Task before 5pm today.*/
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Contract for managing Fractional NFTs
contract FractionalNFT is ERC721URIStorage, Ownable {

    uint256 public tokenCounter;

    // Fractional Ownership Struct for ERC-404
    struct FractionalToken {
        uint256 totalFractions;
        uint256 fractionsAvailable;
        uint256 pricePerFraction;
        mapping(address => uint256) balances; // ERC-404 like ownership
    }

    // Mapping ERC721 token ID to FractionalToken details
    mapping(uint256 => FractionalToken) public fractionalNFTs;

    // Events
    event NFTMinted(uint256 tokenId, address owner);
    event NFTFractionalized(uint256 tokenId, uint256 totalFractions, uint256 pricePerFraction);
    event FractionPurchased(uint256 tokenId, address buyer, uint256 fractionsBought);

    // Pass msg.sender to the Ownable constructor
    constructor() ERC721("FractionalNFT", "fNFT") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    // Mint a single NFT using ERC721
    function mintNFT(string memory tokenURI) public onlyOwner returns (uint256) {
        uint256 newItemId = tokenCounter;
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenCounter += 1;

        emit NFTMinted(newItemId, msg.sender);
        return newItemId;
    }

    // Transfer single NFT using ERC721
    function transferNFT(address to, uint256 tokenId) public {
        require(ownerOf(tokenId) == msg.sender, "You don't own this NFT");
        _transfer(msg.sender, to, tokenId);
    }

    // Fractionalize a single NFT (ERC-404 like)
    function fractionalizeNFT(
        uint256 tokenId,
        uint256 totalFractions,
        uint256 pricePerFraction
    ) public {
        require(ownerOf(tokenId) == msg.sender, "You don't own this NFT");
        FractionalToken storage fNFT = fractionalNFTs[tokenId];
        require(fNFT.totalFractions == 0, "Already fractionalized");

        fNFT.totalFractions = totalFractions;
        fNFT.fractionsAvailable = totalFractions;
        fNFT.pricePerFraction = pricePerFraction;

        emit NFTFractionalized(tokenId, totalFractions, pricePerFraction);
    }

    // Buy fractions of a Fractionalized NFT (ERC-404)
    function buyFractions(uint256 tokenId, uint256 numFractions) public payable {
        FractionalToken storage fNFT = fractionalNFTs[tokenId];
        require(fNFT.fractionsAvailable >= numFractions, "Not enough fractions available");
        require(msg.value == numFractions * fNFT.pricePerFraction, "Incorrect payment amount");

        fNFT.fractionsAvailable -= numFractions;
        fNFT.balances[msg.sender] += numFractions;

        emit FractionPurchased(tokenId, msg.sender, numFractions);
    }

    // Get the fraction balance for a specific user on a specific NFT
    function getFractionBalance(uint256 tokenId, address owner) public view returns (uint256) {
        return fractionalNFTs[tokenId].balances[owner];
    }

    // Transfer ownership of fractions between two parties
    function transferFractionOwnership(
        uint256 tokenId,
        address to,
        uint256 numFractions
    ) public {
        FractionalToken storage fNFT = fractionalNFTs[tokenId];
        require(fNFT.balances[msg.sender] >= numFractions, "Insufficient fractions owned");

        fNFT.balances[msg.sender] -= numFractions;
        fNFT.balances[to] += numFractions;
    }
}
