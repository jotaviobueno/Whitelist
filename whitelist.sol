// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Whitelist {

    address owner;

    mapping(address => bool) whitelistedAddresses;

    modifier onlyOwner() {
      require(msg.sender == owner, "Ownable: caller is not the owner");
      _;
    }

    modifier isWhitelisted(address _address) {
      require(whitelistedAddresses[_address], "Whitelist: You need to be whitelisted");
      _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addUser(address _addressToWhitelist) public onlyOwner {
        whitelistedAddresses[_addressToWhitelist] = true;
    }

    function blackList(address _addressToBlacklist) public onlyOwner {
        whitelistedAddresses[_addressToBlacklist] = false;
    }

    function verifyUser(address _whitelistedAddress) public view returns(bool) {
      bool userIsWhitelisted = whitelistedAddresses[_whitelistedAddress];

      return userIsWhitelisted;
    }
}