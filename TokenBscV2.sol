// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./TokenBaseV2.sol";

contract TokenBscV2 is TokenBaseV2 {
    constructor() TokenBaseV2("BSC Token", "BTK") {}
}
