# Omnichain Asset Bridge

An experimental **omnichain token bridge** demonstrating asset transfers between two Ethereum chains using Foundry, Anvil, and a lightweight relayer.

---

## 📖 Overview
This project simulates cross‑chain asset movement:
- **VaultToken.sol** — ERC20 token with mint/burn functionality.
- **BridgeLock.sol** — lock contract that holds tokens and emits events for the relayer.
- **GovernanceEmergency.sol** — governance contract for emergency unlocks or overrides.

---

## 📂 Project Layout
```
src/                → Solidity contracts
script/             → deployment scripts
test/               → unit tests
relayer/            → relayer service wiring Chain A ↔ Chain B
docker-compose.yml  → optional container setup
foundry.toml        → Foundry configuration
```

---

## ⚙️ Requirements
- [Foundry](https://book.getfoundry.sh/) (`forge`, `anvil`)
- Node.js (for relayer service)
- Docker (optional, for containerized setup)

---

## 🔧 Usage

### Compile Contracts
```bash
forge build
```
Artifacts appear in `out/src/<ContractName>.sol/<ContractName>.json`.

### Run Local Chains
```bash
anvil --port 8545 --chain-id 31337   # Chain A
anvil --port 9545 --chain-id 31338   # Chain B
```

### Deploy Contracts
Use `forge create` with the appropriate RPC URL and private key. Example:
```bash
forge create src/VaultToken.sol:VaultToken \
  --rpc-url http://127.0.0.1:8545 \
  --private-key <anvil-private-key>
```

Repeat for `BridgeLock.sol` and `GovernanceEmergency.sol` on both chains, passing constructor arguments as needed (e.g., VaultToken address into BridgeLock, BridgeLock address into GovernanceEmergency).

---

## 🔗 Relayer Configuration
The relayer connects Chain A and Chain B:
- Point it to both RPC endpoints (`8545` and `9545`).
- Provide deployed contract addresses for BridgeLock on both chains.
- It listens for lock events on Chain A and triggers mint events on Chain B.

---

## 📑 Address Tracking
Maintain a simple mapping of deployed addresses:

```
Chain A (31337)
- VaultToken: <address>
- BridgeLock: <address>
- GovernanceEmergency: <address>

Chain B (31338)
- VaultToken: <address>
- BridgeLock: <address>
- GovernanceEmergency: <address>
```

---

## ✅ Verification
- Contracts compile successfully (`out/` contains artifacts).
- Contracts deploy on both Chain A and Chain B.
- Relayer observes events and propagates cross‑chain actions.

---

## 📜 License
MIT
```
## Contract Addresses
This file records deployed contract addresses for both Chain A and Chain B.  
Update these values after each deployment to keep the bridge configuration consistent.

---

## Chain A (Local Anvil, Chain ID 31337)
- **VaultToken**: `<address>`
- **BridgeLock**: `<address>`
- **GovernanceEmergency**: `<address>`

---

## Chain B (Local Anvil, Chain ID 31338)
- **VaultToken**: `<address>`
- **BridgeLock**: `<address>`
- **GovernanceEmergency**: `<address>`

---


---

