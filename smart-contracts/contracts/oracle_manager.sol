pragma solidity ^0.8.3;
pragma experimental ABIEncoderV2;
// SPDX-License-Identifier: MIT

// CHILD CONTRACT
import { Oracle } from './oracle.sol';

contract OracleManager {

    // DEVICE CONTRACTS
    mapping (string => Oracle) public oracles;

    // USER DEVICE COLLECTIONS, [ETH WALLET => LIST OF CREATED ORACLES]
    mapping (address => string[]) public collections;

    // INIT STATUS
    bool public initialized = false;

    // FETCH SPECIFIC ORACLE
    function fetch_oracle(string memory id) public view returns(Oracle) {
        return oracles[id];
    }

    // FETCH USER COLLECTION
    function fetch_collection(address user) public view returns(string[] memory) {
        return collections[user];
    }

    // CREATE NEW ORACLE
    function create(string memory id) public {

        // IF THE CONTRACT HAS BEEN INITIALIZED
        // IF THE ORACLE DOES NOT EXIST
        require(initialized, 'contract has not been initialized');
        require(!exists(id), 'identifier already exists');

        // CREATE NEW ORACLE CONTRACT
        oracles[id] = new Oracle();

        // ADD IT TO SENDERS COLLECTION
        collections[msg.sender].push(id);
    }

    // INITIALIZE THE CONTRACT
    function init() public {

        // IF THE CONTRACT HAS NOT BEEN INITIALIZED BEFORE
        require(!initialized, 'contract has already been initialized');
        
        // BLOCK RE-INITIALIZATION
        initialized = true;
    }

    // CHECK IF ORACLE EXISTS
    function exists(string memory id) public view returns(bool) {
        if (address(oracles[id]) != 0x0000000000000000000000000000000000000000) {
            return true;
        } else {
            return false;
        }
    }
}