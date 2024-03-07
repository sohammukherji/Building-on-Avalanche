# Building on Avalanche - ETH + AVAX

## Description
SweetToken is a simple ERC-20 token smart contract implemented in Solidity. The contract allows users to mint new tokens, burn existing tokens, transfer tokens, and redeem tokens for different types of sweets (CHOCOLATE, LOLLIPOP, CANDY_CANE, GUMMY_BEARS). Each sweet has a specific cost in SweetTokens, and users can choose to redeem their tokens for their favorite sweets.

## Smart Contract Details
### Sweet Enumeration
The contract defines an enumeration `Sweet` with values representing different types of sweets.

### Events
- **SweetRedeemed**: Fired when a user redeems tokens for a sweet. Includes the user's address, the type of sweet redeemed, and the cost in tokens.

### State Variables
- **userSelectedSweets**: A mapping that associates each user's address with their selected sweet.

### Functions
- **mint_function**: Allows the contract owner to mint new tokens and assign them to a specified address.
- **burn_function**: Allows a user to burn a specified number of their tokens.
- **redeem_function**: Allows a user to redeem tokens for a specific sweet.
- **transfer_function**: Allows a user to transfer tokens to another address.
- **getSweetCost**: Internal function to get the cost of a specific sweet in tokens.

## Usage
1. Deploy the SweetToken contract with the desired initial owner address.
2. Mint tokens using the `mint_function` for initial distribution.
3. Users can burn tokens using the `burn_function`.
4. Users can redeem tokens for sweets using the `redeem_function`.
5. Tokens can be transferred between addresses using the `transfer_function`.


## Author
Soham Mukherjee

## License
This project is licensed under the MIT License. 
