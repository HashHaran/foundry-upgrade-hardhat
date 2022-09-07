// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import {ERC1967UpgradeUpgradeable} from "openzeppelin-contracts-upgradeable/contracts/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol";
import {VersionAware} from "../VersionAware.sol";

contract TransparentProxyPatternV2 is ERC1967UpgradeUpgradeable, VersionAware {
    constructor() {
        _disableInitializers();
    }

    function initialize() external reinitializer(2) {
        versionAwareContractName = "Transparent Proxy Pattern: V2";
    }

    function getContractNameWithVersion()
        public
        pure
        override
        returns (string memory)
    {
        return "Transparent Proxy Pattern: V2";
    }
}
