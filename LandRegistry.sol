// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LandRegistry {
    struct Plot {
        uint id;
        string coordinates;
        address owner;
    }

    mapping(uint => Plot) public plots;
    uint public plotCount;

    function registerPlot(string memory _coordinates) public {
        plotCount++;
        plots[plotCount] = Plot(plotCount, _coordinates, msg.sender);
    }

    function transferOwnership(uint _plotId, address _newOwner) public {
        require(msg.sender == plots[_plotId].owner, "Only owner can transfer");
        plots[_plotId].owner = _newOwner;
    }

    function getPlot(uint _plotId) public view returns (Plot memory) {
        return plots[_plotId];
    }
}
