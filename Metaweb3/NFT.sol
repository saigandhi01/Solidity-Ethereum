// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract RealEstateNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct Asset {
        string assetType; // House, Villa, Land, Fractional Land, E-commerce Share
        uint256 totalPriceINR;
        uint256 totalPriceBTC;
        uint256 nftPriceINR;
        uint256 nftPriceBTC;
    }

    mapping(uint256 => Asset) public assetDetails;

    constructor() ERC721("RealEstateNFT", "RENFT") Ownable(msg.sender) {}

    function mintNFT(
        address recipient,
        string memory tokenURI,
        string memory assetType,
        uint256 totalPriceINR,
        uint256 totalPriceBTC,
        uint256 nftPriceINR,
        uint256 nftPriceBTC
    ) public onlyOwner returns (uint256) {
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();
        _mint(recipient, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        
        assetDetails[newTokenId] = Asset(assetType, totalPriceINR, totalPriceBTC, nftPriceINR, nftPriceBTC);
        
        return newTokenId;
    }

    function transferNFT(address from, address to, uint256 tokenId) public {
        require(ownerOf(tokenId) == msg.sender || getApproved(tokenId) == msg.sender || isApprovedForAll(ownerOf(tokenId), msg.sender), "Not authorized to transfer");
        _transfer(from, to, tokenId);
    }

    function buyNFT(uint256 tokenId) public payable {
        require(msg.value >= assetDetails[tokenId].nftPriceINR, "Insufficient funds");
        address owner = ownerOf(tokenId);
        payable(owner).transfer(msg.value);
        _transfer(owner, msg.sender, tokenId);
    }

    function sellNFT(uint256 tokenId, uint256 sellPriceINR, uint256 sellPriceBTC) public {
        require(ownerOf(tokenId) == msg.sender, "Only owner can sell");
        assetDetails[tokenId].nftPriceINR = sellPriceINR;
        assetDetails[tokenId].nftPriceBTC = sellPriceBTC;
    }
}
