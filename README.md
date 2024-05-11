# eth-avax-erc20-token
This is a Solidity smart contract code for a ERC20 standard token called ATCOIN, with an additional mintable functionality.

Here's a breakdown of the code:

ATCOIN Contract:
- Defines the basic properties of the token (name, symbol, decimals).
-Sets up events for tracking token transfers and approvals.
-Initializes the total supply and maximum total supply.
-Maps addresses to their token balances and allowances.

Functions:
    - balanceOf: Returns a user's token balance.
    - transfer: Transfers tokens from one address to another.
    - approve: Approves an address to spend tokens on behalf of another address.
    -burn: Allows every token holder to burn tokens 
    - allowance: Returns the remaining allowance for a spender.
    - transferFrom: Transfers tokens from one address to another, using approved allowances.

Mintable Contract:

1. Inherits from the ATCOIN contract.
2. Adds a mint function to create new tokens and assign them to a recipient.
    - Requires that the total supply not exceed the maximum total supply.
    - Increments the recipient's balance and the total supply.
    - Emits a Transfer event from the zero address (representing the minting process).

This contract allows for token creation, transfer, approval, and minting, with basic functionality for a cryptocurrency token.
