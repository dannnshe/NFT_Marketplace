// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**@author Abbas and Dan
 * @title Simple NFT Marketplace
 */

//Imports Interfaces, Libraries, Contracts

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// errors

// Contract

contract NFT_Marketplace is ERC721, Ownable {
    //using statements from library

    //State Variables, type declarations

    using Counters for Counters.Counter;
    Counters.Counter private _listingIds;

    address payable private _contractOwner;

    struct Listing {
        uint256 listingIds;
        address seller;
        uint256 tokenId;
        uint256 price;
    }

    mapping(uint256 => Listing) private _listings;

    //Events

    //modifiers

    // constructor

    constructor() ERC721("Market Place", "MKT") {
        _contractOwner = payable(msg.sender);
    }

    // receive function (if exists)

    // fallback function (if exists)

    // external

    // External view

    // External pure

    // public

function createListing(uint256 tokenId, uint256 price) public {
     require(price > 0, "Price must be greater then zero");
    _listingIds.increment();
    uint256 listingId = _listingIds.current();
    _listings[listingId] = Listing(listingId, msg.sender, tokenId, price);
    _transfer(msg.sender, address(this), tokenId);

} 

function updatePrice(uint256 listingId, uint256 newPrice) public {
   require(_listings[listingId].seller == msg.sender, "Only the seller can update the price");
        _listings[listingId].price = newPrice;
}

function withdrawListing() public {

}

    function purchaseListing() public {}

    // internal

    // internal

    // private

    //Getter Function



}
