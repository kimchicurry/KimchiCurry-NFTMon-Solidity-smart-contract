// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract NFTMonDefaultOne is ERC721, ERC721Pausable, Ownable, ERC721Burnable {
    //add a storage called CID
    bytes32 public cid;
    uint256 public constant middleValue =
        57896044618658097711785492504343953926634992332820282019728792003956564819967;

    struct nftMonToken {
        string name;
        uint256 hp;
        uint256 attack;
        uint256 defense;
        uint256 stamina;
        uint256 speed;
        uint256 nftType;
    }

    nftMonToken public nftMonCurrentToken =
        nftMonToken({
            name: "Default One",
            hp: 20000,
            attack: 16000,
            defense: 12000,
            stamina: 100,
            speed: 13000,
            nftType: 1
        });

    constructor(
        address initialOwner
    ) ERC721("NFTMon", "NFTM") Ownable(initialOwner) {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://ipfs.io/ipfs/";
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return
            bytes(baseURI).length > 0
                ? string.concat(baseURI, _bytes32ToString(cid))
                : "";
    }

    function setCID(bytes32 _cid) external {
        cid = _cid;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _update(
        address to,
        uint256 tokenId,
        address auth
    ) internal override(ERC721, ERC721Pausable) returns (address) {
        return super._update(to, tokenId, auth);
    }

    function _bytes32ToString(
        bytes32 _bytes32
    ) internal pure returns (string memory) {
        uint8 i = 0;
        while (i < 32 && _bytes32[i] != 0) {
            i++;
        }
        bytes memory bytesArray = new bytes(i);
        for (i = 0; i < 32 && _bytes32[i] != 0; i++) {
            bytesArray[i] = _bytes32[i];
        }
        return string(bytesArray);
    }
}
