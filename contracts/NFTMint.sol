// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTMint is ERC721, Ownable {
    uint256 mintAmount = 0.01 ether;
    uint256 public maxSupply;
    uint256 public totalSupply;
    bool public isMintEnabled;
    mapping(address => uint256) public walletMints;

    constructor() ERC721("NFT Mint", "NFTMINT") Ownable(msg.sender) {
        maxSupply = 2;
    }

    function toggleIsMintEnabled() external onlyOwner {
        isMintEnabled = !isMintEnabled;
    }

    function setMaxSupply(uint256 _maxSupply) external onlyOwner {
        maxSupply = _maxSupply;
    }

    function mint() external payable {
        require(isMintEnabled, "Minting is not enabled");
        require(totalSupply < maxSupply, "Sold out");
        require(walletMints[msg.sender] < 1, "Mints per wallets exceeded");
        require(msg.value == mintAmount, "Invalid ether");

        walletMints[msg.sender]++;
        totalSupply++;
        uint256 tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);
    }
}
