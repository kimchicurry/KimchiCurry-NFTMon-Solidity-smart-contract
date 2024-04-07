// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./NFTMon.sol";

// import "./NFTMonDefaultOne.sol";
// import "./NFTMonDefaultTwo.sol";
// import "./NFTMonDefaultThree.sol";

contract NFTFactory {
    address[] public deployedNFTs;
    uint256 someRandomNumber = 29387429384234;

    function setRandomNumber(uint256 _randomNumber) public {
        someRandomNumber = _randomNumber;
    }

    function mateNFTMons(
        address _fatherNFT,
        address _motherNFT,
        string calldata _name
    ) public {
        //TODO access control
        NFTMon newNFTMon = new NFTMon(msg.sender);
        //we need to add call setter fns, based on the NFTs in the params.abi
        // uint256 someRandomNumber = 29387429384234;
        //Todo, with VRF, replace above line
        //get struct from _fatherNFT
        // Retrieve attributes and store them in local nftMonToken struct variables
        NFTMon.nftMonToken memory fatherAttributes = NFTMon(_fatherNFT)
            .getNFTMonCurrentToken();
        NFTMon.nftMonToken memory motherAttributes = NFTMon(_motherNFT)
            .getNFTMonCurrentToken();

        // Use the struct variables to call setter functions
        newNFTMon.setName(_name);
        newNFTMon.setNFTType(
            fatherAttributes.nftType,
            motherAttributes.nftType,
            someRandomNumber
        );
        newNFTMon.setStamina(
            fatherAttributes.stamina,
            motherAttributes.stamina,
            someRandomNumber
        );
        newNFTMon.setAttack(
            fatherAttributes.attack,
            motherAttributes.attack,
            someRandomNumber
        );
        newNFTMon.setDefense(
            fatherAttributes.defense,
            motherAttributes.defense,
            someRandomNumber
        );
        newNFTMon.setSpeed(
            fatherAttributes.speed,
            motherAttributes.speed,
            someRandomNumber
        );
        newNFTMon.setHP(
            fatherAttributes.hp,
            motherAttributes.hp,
            someRandomNumber
        );
        deployedNFTs.push(address(newNFTMon));
    }

    function createNFTMonDefault(uint256 _number) public {
        NFTMon newNFTMonDefault = new NFTMon(msg.sender);
        //later call a defaultSet function that accepts _number as fn arg.
        if (_number == 0) {
            newNFTMonDefault.setDefault(0);
        } else if (_number == 1) {
            newNFTMonDefault.setDefault(1);
        } else if (_number == 2) {
            newNFTMonDefault.setDefault(2);
        }
        deployedNFTs.push(address(newNFTMonDefault));
    }

    // function createNFTMonDefaultTwo() public {
    //     NFTMonDefaultTwo newNFTMonDefaultTwo = new NFTMonDefaultTwo(msg.sender);
    //     deployedNFTs.push(address(newNFTMonDefaultTwo));
    // }

    // function createNFTMonDefaultThree() public {
    //     NFTMonDefaultThree newNFTMonDefaultThree = new NFTMonDefaultThree(
    //         msg.sender
    //     );
    //     deployedNFTs.push(address(newNFTMonDefaultThree));
    // }

    function getDeployedNFTs() public view returns (address[] memory) {
        return deployedNFTs;
    }
}
