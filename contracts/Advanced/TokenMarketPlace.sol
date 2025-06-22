// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract TokenMarketPlace is Ownable {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    uint256 public tokenPrice = 2e16 wei; // 0.02 ether per GLD token
    uint256 public sellerCount = 1;
    uint256 public buyerCount = 1;
    uint256 public prevAdjustedRatio;

    IERC20 public gldToken;

    event TokenPriceUpdated(uint256 newPrice);
    event TokenBought(address indexed buyer, uint256 amount, uint256 totalCost);
    event TokenSold(
        address indexed seller,
        uint256 amount,
        uint256 totalEarned
    );
    event TokensWithdrawn(address indexed owner, uint256 amount);
    event EtherWithdrawn(address indexed owner, uint256 amount);
    event CalculateTokenPrice(uint256 priceToPay);

    // the person deploying this contract will become the owner
    constructor(address _gldToken) Ownable(msg.sender) {
        gldToken = IERC20(_gldToken);
    }

    // Updated logic for token price calculation with safeguards
    function adjustTokenPriceBasedOnDemand() public {
        uint256 marketDemandRatio = buyerCount.mul(1e18).div(sellerCount);
        uint256 smoothingFactor = 1e18;
        uint256 adjustedRatio = marketDemandRatio.add(smoothingFactor).div(2);
        if (prevAdjustedRatio != adjustedRatio) {
            prevAdjustedRatio = adjustedRatio;
            uint256 newTokenPrice = tokenPrice.mul(adjustedRatio).div(1e18);
            uint256 minimumPrice = 2e16;
            if (newTokenPrice < minimumPrice) {
                tokenPrice = minimumPrice;
            }
            tokenPrice = newTokenPrice;
        }
    }

    // Buy tokens from the marketplace
    function buyGLDToken(uint256 _amountOfToken) public payable {
        uint256 requiredTokenPrice = calculateTokenPrice(_amountOfToken);
        console.log("requiredTokenPrice", requiredTokenPrice);
        require(requiredTokenPrice == msg.value, "Incorrect token price paid");
        buyerCount = buyerCount + 1;
        // Transfer token to the buyer address
        gldToken.safeTransfer(msg.sender, _amountOfToken);
        // Event Emiting
        emit TokenBought(msg.sender, _amountOfToken, requiredTokenPrice);
    }

    function calculateTokenPrice(uint256 _amountOfToken)
        public
        returns (uint256)
    {
        require(_amountOfToken > 0, "Amount Of Token > 0");
        adjustTokenPriceBasedOnDemand();
        uint256 amountToPay = _amountOfToken.mul(tokenPrice).div(1e18);
        console.log("amountToPay", amountToPay);
        return amountToPay;
    }

    // Sell tokens back to the marketplace
    function sellGLDToken(uint256 amountOfToken) public {
        require(
            gldToken.balanceOf(msg.sender) >= amountOfToken,
            "invalid amount of token"
        );
        uint256 priceToPayToUser = calculateTokenPrice(amountOfToken);
        gldToken.safeTransferFrom(msg.sender, address(this), amountOfToken);
        (bool success, ) = payable(msg.sender).call{value: priceToPayToUser}(
            ""
        );
        require(success, "Transaction Failed");
        emit TokenSold(msg.sender, amountOfToken, priceToPayToUser);
    }

    // Owner can withdraw excess tokens from the contract
    function withdrawTokens(uint256 amount) public onlyOwner {
        require(gldToken.balanceOf(address(this)) >= amount, "Out of balance");
        gldToken.safeTransfer(msg.sender, amount);
        emit TokensWithdrawn(msg.sender, amount);
    }

    // Owner can withdraw accumulated Ether from the contract
    function withdrawEther(uint256 amount) public onlyOwner {
        require(address(this).balance >= amount, "Insufficient Ether");
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Ether withdrawal failed");
        emit EtherWithdrawn(msg.sender, amount);
    }
}
