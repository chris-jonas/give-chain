# GiveChain - Decentralized Charity Platform

[![Clarity Version](https://img.shields.io/badge/clarity-v3.1-blue)](https://docs.stacks.co/clarity/)
[![License](https://img.shields.io/badge/license-ISC-green.svg)](LICENSE)
[![Tests](https://img.shields.io/badge/tests-vitest-green.svg)](https://vitest.dev/)

A revolutionary blockchain-powered platform that transforms charitable giving through smart contracts, enabling direct donor-to-beneficiary connections with real-time impact tracking and guaranteed fund transparency on the Stacks network.

## 🌟 Overview

GiveChain redefines philanthropy by eliminating intermediaries and establishing trust through immutable blockchain records. This smart contract creates a self-governing ecosystem where every donation is tracked from contribution to impact, ensuring that charitable funds reach their intended recipients efficiently and transparently.

## 🚀 Key Features

- **Multi-tier Governance System**: Admin, Moderator, and Beneficiary roles with granular permissions
- **Comprehensive Beneficiary Verification**: Streamlined onboarding process with status tracking
- **Real-time STX Donation Tracking**: Complete audit trails for all transactions
- **Milestone-driven Fund Distribution**: Community oversight for fund utilization
- **Automated Transparency Reporting**: Maximum donor confidence through immutable records
- **Smart Contract-enforced Accountability**: Blockchain-guaranteed fund management

## 🏗️ Architecture

### Smart Contract Components

#### Role Management

- **Admin**: Contract owner with full permissions
- **Moderator**: Can register beneficiaries and manage verification
- **Beneficiary**: Verified entities eligible to receive donations

#### Core Data Structures

- **Beneficiaries**: Registry with comprehensive tracking (name, description, target amount, received amount, status)
- **Donations**: Complete history with donor, beneficiary, amount, and timestamp
- **Utilization**: Milestone-based fund distribution tracking

#### Security Features

- Role-based access control
- Input validation and sanitization
- Error handling with descriptive constants
- Immutable audit trails

## 🛠️ Technical Stack

- **Blockchain**: Stacks Network
- **Smart Contract Language**: Clarity v3.1
- **Development Framework**: Clarinet
- **Testing**: Vitest with Clarinet SDK
- **TypeScript**: For test development

## 📋 Prerequisites

- [Clarinet](https://docs.hiro.so/clarinet/) >= 2.0
- [Node.js](https://nodejs.org/) >= 18.x
- [npm](https://www.npmjs.com/) >= 8.x

## ⚡ Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/chris-jonas/give-chain.git
cd give-chain
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Check Contract Syntax

```bash
clarinet check
```

### 4. Run Tests

```bash
npm test
```

### 5. Deploy to Devnet

```bash
clarinet integrate
```

## 🧪 Testing

The project uses Vitest with the Clarinet SDK for comprehensive testing:

```bash
# Run all tests
npm test

# Run tests with coverage and cost analysis
npm run test:report

# Watch mode for development
npm run test:watch
```

## 📊 Contract Functions

### Public Functions

#### Role Management

- `set-role(user: principal, new-role: uint)` - Assign role to user (Admin only)
- `remove-role(user: principal)` - Remove user role (Admin only)

#### Beneficiary Management

- `register-beneficiary(name: string-utf8, description: string-utf8, target-amount: uint)` - Register new beneficiary (Moderator+)

#### Donations

- `donate(beneficiary-id: uint, amount: uint)` - Process donation to beneficiary

#### Fund Utilization

- `add-utilization(beneficiary-id: uint, description: string-utf8, amount: uint)` - Add fund utilization proposal (Admin only)
- `approve-utilization(beneficiary-id: uint, milestone: uint)` - Approve fund utilization milestone (Admin only)

### Read-Only Functions

- `get-beneficiary(id: uint)` - Retrieve beneficiary information
- `get-donation-by-id(donation-id: uint)` - Retrieve donation details
- `get-donation-count()` - Get total donation count
- `get-utilization-by-id(utilization-id: uint)` - Retrieve utilization details
- `get-utilization-count()` - Get total utilization count

## 🔧 Configuration

### Role Constants

```clarity
ROLE-ADMIN: u1        ;; Full contract permissions
ROLE-MODERATOR: u2    ;; Can manage beneficiaries
ROLE-BENEFICIARY: u3  ;; Can receive donations
```

### Error Codes

```clarity
ERR-NOT-AUTHORIZED: u100         ;; Insufficient permissions
ERR-ALREADY-REGISTERED: u101     ;; Entity already exists
ERR-NOT-FOUND: u102              ;; Entity not found
ERR-INSUFFICIENT-FUNDS: u103     ;; Insufficient STX balance
ERR-BENEFICIARY-NOT-FOUND: u104  ;; Beneficiary doesn't exist
ERR-UTILIZATION-NOT-FOUND: u105  ;; Utilization record not found
ERR-INVALID-INPUT: u106          ;; Invalid function parameters
```

## 🔐 Security Considerations

- **Role-based Access Control**: Hierarchical permission system prevents unauthorized actions
- **Input Validation**: All user inputs are validated before processing
- **Fund Safety**: STX transfers are handled through secure Clarity primitives
- **Immutable Records**: All transactions are permanently recorded on-chain
- **Owner Protection**: Contract owner cannot be demoted or removed

## 🚀 Deployment

### Devnet Deployment

```bash
clarinet integrate
```

### Testnet Deployment

```bash
clarinet deploy --testnet
```

### Mainnet Deployment

```bash
clarinet deploy --mainnet
```

## 📖 Usage Examples

### Register a Beneficiary

```typescript
// As a moderator
const result = simnet.callPublicFn(
  "give-chain",
  "register-beneficiary",
  [
    Cl.stringUtf8("Local Food Bank"),
    Cl.stringUtf8("Providing meals to families in need"),
    Cl.uint(1000000) // 1 STX target
  ],
  moderatorAddress
);
```

### Make a Donation

```typescript
const result = simnet.callPublicFn(
  "give-chain",
  "donate",
  [
    Cl.uint(1), // beneficiary ID
    Cl.uint(100000) // 0.1 STX
  ],
  donorAddress
);
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Write comprehensive tests for all functions
- Follow Clarity best practices
- Use descriptive variable and function names
- Include proper error handling
- Document complex logic with comments

## 📄 License

This project is licensed under the ISC License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Stacks Foundation](https://stacks.org/) for the blockchain infrastructure
- [Hiro](https://hiro.so/) for development tools and documentation
- The Clarity community for best practices and support

---

**GiveChain** - Transforming charity through blockchain transparency
