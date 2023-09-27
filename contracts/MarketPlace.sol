// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**@author Abbas and Dan
 * @title Simple NFT Marketplace
 */

//Imports Interfaces, Libraries, Contracts

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// errors

// Contract

contract NFT_Marketplace is ERC721, Ownable {
    //using statements from library

    using Counters for Counters.Counter;

    //State Variables, type declarations

    Counters.Counter private _tokenID;

    // keeping up with all the items that have been created
    // pass in the integer which is the item id and it returns a market item.
    // to fetch a market item, we only need the item id
    mapping(uint256 => listedItem) public idToListedItems;

    uint256 public listingFee = 10; // use coinmarketcap to convert eth to usd

    struct listedItem {
        uint256 tokenID;
        address seller;
        address owner;
        uint256 price;
        bool sold;
        bool onSale;
    }

    //Events

    //modifiers

    // constructor

    constructor() ERC721("Market Place", "MKT") {}

    // receive function (if exists)

    // fallback function (if exists)

    // external

    // External view

    // External pure

    // public

    // Create listing buy buyers
    function createListing(string tokenURI, uint256 price) public payable returns (uint256) {
        require(price > 0, "Price must be at at lease 1 wei");
        require(msg.value == listingFee, "Price must be equal to listing fee");
        require(string(tokenURI).length > 0, "Token URI must not be empty");
        uint256 tokenId = _tokenID.increment();
        _mint(msg.sender, tokenId);
        _setTokenURI(tokenId, tokenURI);
        listOnMarketplace(_tokenID, price);

        return tokenId;
    }

    function listOnMarketplace(uint256 tokenId, uint256 price) private {
        idToListedItems[tokenId] = listedItem(
            tokenId,
            payable(msg.sender),
            payable(address(this)),
            price,
            false
        );
    }

    function updatePrice(uint256 tokenId, uint256 newPrice) public {
        require(
            idToListedItems[tokenId].seller == msg.sender,
            "Only the seller can update the price"
        );
        idToListedItems[tokenId].price = newPrice;
    }

    function withdrawListing() public {}

    function purchaseListing() public {}

    // internal

    // internal

    // private

    //Getter Function

 
}

