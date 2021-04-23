pragma solidity ^0.8.3;
pragma experimental ABIEncoderV2;
// SPDX-License-Identifier: MIT

// CHILD CONTRACT
import { Task } from './task.sol';

contract TaskManager {

    // TASK CONTRACTS
    mapping (address => Task) public tasks;
}