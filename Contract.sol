pragma solidity ^0.8.0;

contract ScavengerHuntNFT {
    address public owner;
    mapping(address => bool) public winners;
    mapping(uint256 => bool) public cluesFound;
    uint256 public totalClues = 5;
    uint256 public cluesCollected;
    uint256 public rewardTokenId;
    bool public huntActive = true;

    event ClueFound(address indexed player, uint256 clueId);
    event HuntCompleted(address indexed winner, uint256 tokenId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier huntIsActive() {
        require(huntActive, "Hunt is not active");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function findClue(uint256 clueId) public huntIsActive {
        require(clueId < totalClues, "Invalid clue");
        require(!cluesFound[clueId], "Clue already found");
        
        cluesFound[clueId] = true;
        cluesCollected++;
        emit ClueFound(msg.sender, clueId);

        if (cluesCollected == totalClues) {
            winners[msg.sender] = true;
            rewardTokenId++;
            emit HuntCompleted(msg.sender, rewardTokenId);
            huntActive = false; // Ends the hunt after first winner
        }
    }

    function restartHunt() public onlyOwner {
        for (uint256 i = 0; i < totalClues; i++) {
            cluesFound[i] = false;
        }
        cluesCollected = 0;
        huntActive = true;
    }
}
