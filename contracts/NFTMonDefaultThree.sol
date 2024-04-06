// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract NFTMonDefaultThree is ERC721, ERC721Pausable, Ownable, ERC721Burnable {
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
            name: "Default Three",
            hp: 40000,
            attack: 12000,
            defense: 16000,
            stamina: 300,
            speed: 15000,
            nftType: 3
        });

    function setName(string memory _name) public {
        nftMonCurrentToken.name = _name;
    }

    function setNFTType(
        uint8 _nftTypeFather,
        uint8 _nftTypeMother,
        uint256 randomValue
    ) public {
        uint8 _nftType;

        if (randomValue > middleValue) {
            _nftType = _nftTypeFather;
        } else {
            _nftType = _nftTypeMother;
        }

        nftMonCurrentToken.nftType = _nftType;
    }

    function setStamina(
        uint8 _staminaFather,
        uint8 _staminaMother,
        uint256 randomValue
    ) public {
        uint256 fatherPercent = 0;

        if (randomValue > middleValue) {
            fatherPercent = 7500;
        } else {
            fatherPercent = 2500;
        }

        uint8 _stamina = uint8(
            ((_staminaFather * fatherPercent) / 10000) +
                ((_staminaMother * (10000 - fatherPercent)) / 10000)
        );
        nftMonCurrentToken.stamina = _stamina;
    }

    function setAttack(
        uint256 _attackFather,
        uint256 _attackMother,
        uint256 randomValue
    ) public {
        uint256 fatherPercent = 0;

        if (randomValue > middleValue) {
            fatherPercent = 7500;
        } else {
            fatherPercent = 2500;
        }

        uint256 _attack = ((_attackFather * fatherPercent) / 10000) +
            ((_attackMother * (10000 - fatherPercent)) / 10000);
        nftMonCurrentToken.hp = _attack;
    }

    function setDefense(
        uint256 _defenseFather,
        uint256 _defenseMother,
        uint256 randomValue
    ) public {
        uint256 fatherPercent = 0;

        if (randomValue > middleValue) {
            fatherPercent = 7500;
        } else {
            fatherPercent = 2500;
        }

        uint256 _defense = ((_defenseFather * fatherPercent) / 10000) +
            ((_defenseMother * (10000 - fatherPercent)) / 10000);
        nftMonCurrentToken.hp = _defense;
    }

    function setSpeed(
        uint256 _speedFather,
        uint256 _speedMother,
        uint256 randomValue
    ) public {
        uint256 fatherPercent = 0;

        if (randomValue > middleValue) {
            fatherPercent = 7500;
        } else {
            fatherPercent = 2500;
        }

        uint256 _speed = ((_speedFather * fatherPercent) / 10000) +
            ((_speedMother * (10000 - fatherPercent)) / 10000);
        nftMonCurrentToken.hp = _speed;
    }

    function setHP(
        uint256 _hpFather,
        uint256 _hpMother,
        uint256 randomValue
    ) public {
        uint256 fatherPercent = 0;

        if (randomValue > middleValue) {
            fatherPercent = 7500;
        } else {
            fatherPercent = 2500;
        }

        uint256 _hp = ((_hpFather * fatherPercent) / 10000) +
            ((_hpMother * (10000 - fatherPercent)) / 10000);
        nftMonCurrentToken.hp = _hp;
    }

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
