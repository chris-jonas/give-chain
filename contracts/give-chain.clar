;; Title: GiveChain - Decentralized Charity Platform
;;
;; SUMMARY:
;; A revolutionary blockchain-powered platform that transforms charitable giving through
;; smart contracts, enabling direct donor-to-beneficiary connections with real-time
;; impact tracking and guaranteed fund transparency on the Stacks network.
;;
;; DESCRIPTION:
;; GiveChain redefines philanthropy by eliminating intermediaries and establishing trust
;; through immutable blockchain records. This smart contract creates a self-governing
;; ecosystem where every donation is tracked from contribution to impact, ensuring that
;; charitable funds reach their intended recipients efficiently and transparently.
;;
;; Key Features:
;;   - Multi-tier governance system with Admin, Moderator, and Beneficiary roles
;;   - Comprehensive beneficiary verification and onboarding process
;;   - Real-time STX donation tracking with complete audit trails
;;   - Milestone-driven fund distribution with community oversight
;;   - Automated transparency reporting for maximum donor confidence
;;   - Smart contract-enforced accountability measures

;; CONTRACT CONFIGURATION

;; Contract owner principal
(define-data-var contract-owner principal tx-sender)

;; ERROR DEFINITIONS

(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-ALREADY-REGISTERED (err u101))
(define-constant ERR-NOT-FOUND (err u102))
(define-constant ERR-INSUFFICIENT-FUNDS (err u103))
(define-constant ERR-BENEFICIARY-NOT-FOUND (err u104))
(define-constant ERR-UTILIZATION-NOT-FOUND (err u105))
(define-constant ERR-INVALID-INPUT (err u106))

;; ROLE CONSTANTS

(define-constant ROLE-ADMIN u1)
(define-constant ROLE-MODERATOR u2)
(define-constant ROLE-BENEFICIARY u3)

;; DATA STRUCTURES

;; User role management
(define-map roles
  { user: principal }
  { role: uint }
)

;; Beneficiary registry with comprehensive tracking
(define-map beneficiaries
  { id: uint }
  {
    name: (string-utf8 50),
    description: (string-utf8 255),
    target-amount: uint,
    received-amount: uint,
    status: (string-ascii 20),
  }
)

;; Complete donation history with timestamps
(define-map donations
  { id: uint }
  {
    donor: principal,
    beneficiary-id: uint,
    amount: uint,
    timestamp: uint,
  }
)

;; Fund utilization tracking with milestone management
(define-map utilization
  { id: uint }
  {
    beneficiary-id: uint,
    milestone: uint,
    description: (string-utf8 255),
    amount: uint,
    status: (string-ascii 20),
  }
)

;; GLOBAL COUNTERS

(define-data-var beneficiary-count uint u0)
(define-data-var donation-count uint u0)
(define-data-var utilization-count uint u0)