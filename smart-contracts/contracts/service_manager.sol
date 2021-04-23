pragma solidity ^0.8.3;
pragma experimental ABIEncoderV2;
// SPDX-License-Identifier: MIT

// CHILD CONTRACT
import { Service } from './service.sol';

contract ServiceManager {

    // SERVICE CONTRACTS
    mapping (address => Service) public services;

    // ITERABLE LIST OF SERVICES
    address[] public listed;
}