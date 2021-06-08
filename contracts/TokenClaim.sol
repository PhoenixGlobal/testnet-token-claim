// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenClaim {
    IERC20 public token;
    address public spender;
    uint256 public minClaimPeriod;
    uint256 public transferAmount;

    constructor(
        address _token,
        address _spender,
        uint256 _transferAmount
    ) {
        token = IERC20(_token);
        spender = _spender;
        transferAmount = _transferAmount;
    }

    function claim() public {
        token.transferFrom(spender, msg.sender, transferAmount);
    }
}
