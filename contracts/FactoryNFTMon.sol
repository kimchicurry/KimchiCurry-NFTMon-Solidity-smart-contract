// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./NFTMon.sol";
import "./NFTMonDefaultOne.sol";
import "./NFTMonDefaultTwo.sol";
import "./NFTMonDefaultThree.sol";

contract NFTFactory {
    address[] public deployedNFTs;

    function mateNFTMons(
        address _fatherNFT,
        address _motherNFT,
        string calldata _name
    ) public {
        NFTMon newNFTMon = new NFTMon(msg.sender);
        //we need to add call setter fns, based on the NFTs in the params.abi
        newNFTMon.setName(_name);
        newNFTMon.deployedNFTs.push(address(newNFTMon));
    }

    function createNFTMonDefaultOne() public {
        NFTMonDefaultOne newNFTMonDefaultOne = new NFTMonDefaultOne(msg.sender);
        deployedNFTs.push(address(newNFTMonDefaultOne));
    }

    function createNFTMonDefaultTwo() public {
        NFTMonDefaultTwo newNFTMonDefaultTwo = new NFTMonDefaultTwo(msg.sender);
        deployedNFTs.push(address(newNFTMonDefaultTwo));
    }

    function createNFTMonDefaultThree() public {
        NFTMonDefaultThree newNFTMonDefaultThree = new NFTMonDefaultThree(
            msg.sender
        );
        deployedNFTs.push(address(newNFTMonDefaultThree));
    }

    function getDeployedNFTs() public view returns (address[] memory) {
        return deployedNFTs;
    }
}
