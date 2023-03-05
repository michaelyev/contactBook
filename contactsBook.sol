// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface IContactBook {
    // Returns a list of contacts for a given address
    function getContacts(address caller)
        external
        view
        returns (address[] memory);

    // Adds an address to the caller's list of contacts
    function addContact(address contact) external;

    // Replaces the caller's existing list of contacts with the input parameter
    function setContacts(address[] calldata contacts) external;

    function getNickname(address caller, address contact)
        external
        view
        returns (string memory);

    function setNickname(address contact, string calldata nickname) external;
}

contract ContactBook {
    mapping(address => address[]) public contacts;
    mapping(address => mapping(address => string)) public nicknames;

    function addContact(address contact) external {
        contacts[msg.sender].push(contact);
    }

    function getContacts(address _caller) external view returns (address[] memory) {
        return contacts[_caller];
    }

    function setContacts(address[] memory _contacts) external {
        contacts[msg.sender] = _contacts;
    }

    function setNickname(address _contact, string calldata nickname) external{
        nicknames[msg.sender][_contact] = nickname;
    }

    function getNickname(address caller, address contact)
        external
        view
        returns (string memory){

            return nicknames[caller][contact];
    }

    
}

