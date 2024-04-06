// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

interface INFTMon {
    struct nftMonToken {
        string name;
        uint256 hp;
        uint256 attack;
        uint256 defense;
        uint256 stamina;
        uint256 speed;
        uint256 nftType;
    }

    function setName(string memory _name) external;

    function setNFTType(
        uint256 _nftTypeFather,
        uint256 _nftTypeMother,
        uint256 randomValue
    ) external;

    function setStamina(
        uint256 _staminaFather,
        uint256 _staminaMother,
        uint256 randomValue
    ) external;

    function setAttack(
        uint256 _attackFather,
        uint256 _attackMother,
        uint256 randomValue
    ) external;

    function setDefense(
        uint256 _defenseFather,
        uint256 _defenseMother,
        uint256 randomValue
    ) external;

    function setSpeed(
        uint256 _speedFather,
        uint256 _speedMother,
        uint256 randomValue
    ) external;

    function nftMonCurrentToken()
        external
        view
        returns (
            string memory name,
            uint256 hp,
            uint256 attack,
            uint256 defense,
            uint256 stamina,
            uint256 speed,
            uint256 nftType
        );
}
