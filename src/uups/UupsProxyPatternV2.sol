// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import {UUPSUpgradeable} from "openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";
import {VersionAware} from "../VersionAware.sol";

contract UupsProxyPatternV2 is
    UUPSUpgradeable,
    OwnableUpgradeable,
    VersionAware
{
    constructor() {
        _disableInitializers();
    }

    function initialize() external reinitializer(2) {
        versionAwareContractName = "UUPS Proxy Pattern: V2";

        ///@dev as there is no constructor, we need to initialise the OwnableUpgradeable explicitly
        __Ownable_init();
    }

    ///@dev required by the OZ UUPS module
    function _authorizeUpgrade(address) internal override onlyOwner {}

    function getContractNameWithVersion()
        public
        pure
        override
        returns (string memory)
    {
        return "UUPS Proxy Pattern: V2";
    }
}
