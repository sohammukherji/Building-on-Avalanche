// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract SweetToken is ERC20, Ownable {
    enum Sweet { CHOCOLATE, LOLLIPOP, CANDY_CANE, GUMMY_BEARS }

    event SweetRedeemed(address indexed account, Sweet sweet, uint256 sweetCost);

    mapping(address => Sweet) public userSelectedSweets;

    constructor(address initialOwner) ERC20("SweetToken", "SWT") Ownable(initialOwner) {}

    function mint_function(address to, uint256 tokenTally) external onlyOwner {
        _mint(to, tokenTally);
    }

    function burn_function(uint256 tokenTally) external {
        require(tokenTally > 0, "The number of tokens to destroy must be greater than zero");
        require(balanceOf(msg.sender) >= tokenTally, "Insufficient funds for sweet destruction");
        _burn(msg.sender, tokenTally);
    }

    function redeem_function(uint8 sweetNumber) external {
        Sweet sweet = Sweet(sweetNumber);

        uint256 sweetCost = getSweetCost(sweet);

        require(balanceOf(msg.sender) >= sweetCost, "Insufficient funds for sweet redemption");
        _burn(msg.sender, sweetCost);

        userSelectedSweets[msg.sender] = sweet;
        emit SweetRedeemed(msg.sender, sweet, sweetCost);
    }

    function transfer_function(address recipient, uint256 tokenTally) external {
        require(recipient != address(0), "Invalid recipient address provided");
        require(balanceOf(msg.sender) >= tokenTally, "Insufficient funds for sweet transfer");
        _transfer(msg.sender, recipient, tokenTally);
    }

       function getSweetCost(Sweet sweet) internal pure returns (uint256) {
        if (sweet == Sweet.CHOCOLATE) {
            return 100;
        } else if (sweet == Sweet.LOLLIPOP) {
            return 200;
        } else if (sweet == Sweet.CANDY_CANE) {
            return 300;
        } else {
            return 400;
        }
    }
}
