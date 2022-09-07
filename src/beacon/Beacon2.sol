// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import {IBeaconUpgradeable} from "openzeppelin-contracts-upgradeable/contracts/proxy/beacon/IBeaconUpgradeable.sol";
import {OwnableUpgradeable} from "openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";

contract Beacon2 is IBeaconUpgradeable, OwnableUpgradeable {
    address private impl;

    function initialize(address imp) external initializer {
        impl = imp;

        ///@dev as there is no constructor, we need to initialise the OwnableUpgradeable explicitly
        __Ownable_init();
    }

    function updateImplementation(address imp) external onlyOwner {
        impl = imp;
    }

    function implementation() external view override returns (address) {
        return impl;
    }
}
