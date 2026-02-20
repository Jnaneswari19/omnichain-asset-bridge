// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import "./VaultToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract BridgeLock is Ownable {
    VaultToken public vaultToken;
    bool public paused;
    event Locked(address indexed sender,uint256 amount,string targetChain,address recipient);
    constructor(address _vaultToken){ vaultToken=VaultToken(_vaultToken);}
    function lockTokens(uint256 amount,address recipient,string memory targetChain) external {
        require(!paused,"Bridge paused");
        vaultToken.transferFrom(msg.sender,address(this),amount);
        emit Locked(msg.sender,amount,targetChain,recipient);
    }
    function pauseBridge() external onlyOwner { paused=true; }
    function resumeBridge() external onlyOwner { paused=false; }
}
