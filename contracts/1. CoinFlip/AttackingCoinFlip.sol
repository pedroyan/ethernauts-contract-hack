// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

contract AttackingCoinFlip {
    CoinFlip public contractAddress;

    constructor(CoinFlip _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Code me!
    }
}
