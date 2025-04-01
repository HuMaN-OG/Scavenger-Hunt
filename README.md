# Scavenger Hunt NFT Smart Contract

This Solidity smart contract implements a simple scavenger hunt game where participants find clues to win an NFT reward. The first player to find all clues wins the hunt, and the contract owner can restart the game if needed.

## Features

- **Clue Discovery**: Players can find clues and progress through the scavenger hunt.
- **Winner Determination**: The first player to find all clues is rewarded with an NFT (token ID incremented for each winner).
- **Restartable Hunts**: The contract owner can restart the hunt for new participants.
- **Fair Play**: Once a hunt is completed, it cannot be restarted until manually reset by the owner.

## Contract Details

- The contract keeps track of clues found using `cluesFound` mapping.
- `findClue(uint256 clueId)`: Players call this function to discover a clue.
- `HuntCompleted` event is triggered when a player wins.
- `restartHunt()` function allows the owner to reset the game.

## Deployment & Usage

1. Deploy the contract on an Ethereum-compatible blockchain.
2. Players interact with `findClue(clueId)` to participate.
3. The contract owner can restart the hunt using `restartHunt()`.

## Contract Address

```
0xa58dCC31CB232032f1e3c2a32974774A327E9262
```

## Events

- `ClueFound(address indexed player, uint256 clueId)`: Triggered when a player finds a clue.
- `HuntCompleted(address indexed winner, uint256 tokenId)`: Triggered when a player completes the hunt and wins the NFT.

## License

This project is open-source under the MIT License.

