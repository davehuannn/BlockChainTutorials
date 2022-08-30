// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// importing another contract
import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray; // array

    // function creates simple storage contracts
    function createSimpleStorage() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    // how do i call another function from another contract
    function sfStore (uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // we need two things to call another function from another contract
        // address
        // ABI - application binary index (stored in every complied contract or anyimported contract
        SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageIndex]); // getting the address of the contract throught index of the simplestorage array
        simpleStorage.store(_simpleStorageNumber);
    }

    // function to retrieve what we stored from the index of the simplestorage array
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}
