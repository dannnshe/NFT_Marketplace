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

    address payable private _contractOwner;

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

function createListing public (){

}

function updatePrice public (){

}

function withdrawListing public () {

}

    function purchaseListing() public {}

    // internal

    // internal

    // private

    //Getter Function

function 

}
