// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// filename : 1_normal.sol
// 
// Usage
// 1. deploy "not_share_storage" smart contract.
// 2. parameter to the remix account and run the setAddress function. 
// 3. check the set address.
// 4. re-deploy "not_share_storage" smart contract
// 5. Check the address and verify that it is empty. 

// Problem
// :: When a smart contract is changed or redeployed, the information stored in the previous smart contract is not available. 

contract not_share_storage {
    address public custAddress;

    function setAddress(address _custAddress) public {
        custAddress = _custAddress;
    }
}

