// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./BridgeBaseV2.sol";

contract BridgeBscV2 is BridgeBaseV2 {
    constructor(address token) BridgeBaseV2(token) {}
}
