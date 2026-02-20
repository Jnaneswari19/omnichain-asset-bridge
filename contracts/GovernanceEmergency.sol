// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import "./VaultToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract GovernanceEmergency is Ownable {
    VaultToken public vaultToken;
    constructor(address _vaultToken){ vaultToken=VaultToken(_vaultToken);}
    function recoverTokens(address to,uint256 amount) external onlyOwner {
        vaultToken.transfer(to,amount);
    }
}
