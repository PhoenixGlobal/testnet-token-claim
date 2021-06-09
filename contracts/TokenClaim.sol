// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Owned.sol";

contract TokenClaim is Owned {
    IERC20 public tokenHZN;
    IERC20 public tokenPHB;
    address public spender;
    uint256 public minClaimPeriod;

    constructor(
        address _tokenHZN,
        address _tokenPHB,
        address _spender,
        address _owner
    ) Owned(_owner) {
        tokenHZN = IERC20(_tokenHZN);
        tokenPHB = IERC20(_tokenPHB);
        spender = _spender;
    }

    function claimHZN(uint256 _amount) external {
        require(_amount <= 1000 * 1e18, "Transfer amount too large.");
        tokenHZN.transferFrom(spender, msg.sender, _amount);
    }

    function claimPHB(uint256 _amount) external {
        require(_amount <= 10000000 * 1e18, "Transfer amount too large.");
        tokenPHB.transferFrom(spender, msg.sender, _amount);
    }
}
