# Omnichain Asset Bridge

[![Foundry](https://img.shields.io/badge/Foundry-Forge-blue)](https://book.getfoundry.sh/)
[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

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

### Run Local Chains
```bash
anvil --port 8545 --chain-id 31337   # Chain A
anvil --port 9545 --chain-id 31338   # Chain B
```

### Deploy Contracts
```bash
forge create src/VaultToken.sol:VaultToken \
  --rpc-url http://127.0.0.1:8545 \
  --private-key <anvil-private-key>
```

Repeat for `BridgeLock.sol` and `GovernanceEmergency.sol` on both chains.

---

## 🔗 Relayer Configuration
- Point to both RPC endpoints (`8545` and `9545`).
- Provide deployed contract addresses for BridgeLock on both chains.
- Relayer listens for lock events on Chain A and triggers mint events on Chain B.

---

## 📑 Address Tracking
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
- Contracts compile successfully.
- Contracts deploy on both Chain A and Chain B.
- Relayer propagates cross‑chain actions.

---

## 📜 License
MIT
```

---

### 🤝 CONTRIBUTING.md

Create a file named `CONTRIBUTING.md`:

```markdown
# Contributing to Omnichain Asset Bridge

We welcome contributions to improve this project!

## How to Contribute
1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/my-feature
   ```
3. Make changes and commit:
   ```bash
   git commit -m "feat: add new feature"
   ```
4. Push to your fork and open a Pull Request.

## Guidelines
- Use conventional commit messages (`feat:`, `fix:`, `docs:`, `chore:`).
- Keep PRs focused and small.
- Update documentation (`README.md`, `addresses.md`) when relevant.
- Ensure tests pass before submitting.
```

---

### 📑 addresses.md

Create a file named `addresses.md`:

```markdown
# Contract Addresses

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
```

---

