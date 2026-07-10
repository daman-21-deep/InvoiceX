# Remove existing git repo
Remove-Item -Recurse -Force .git -ErrorAction SilentlyContinue

# Initialize git
git init
git config user.name "Damandeep Singh"
git config user.email "damanpreetsingh2102@gmail.com"
git branch -M main

# Commit 1: Project init files (includes Cargo.toml with pinned workspace dep + Cargo.lock)
git add package.json package-lock.json tsconfig.json tsconfig.app.json tsconfig.node.json vite.config.ts .gitignore .oxlintrc.json index.html public/favicon.svg public/icons.svg src/assets/react.svg src/assets/vite.svg src/App.css src/main.tsx Cargo.toml Cargo.lock
git commit -m "chore: initialize vite react typescript project structure with pinned soroban deps"

# Commit 2: core registry contract
git add contracts/invoice_registry/Cargo.toml contracts/invoice_registry/src/lib.rs
git commit -m "feat(contracts): implement core InvoiceRegistry smart contract"

# Commit 3: payment manager contract
git add contracts/payment_manager/Cargo.toml contracts/payment_manager/src/lib.rs
git commit -m "feat(contracts): implement PaymentManager smart contract for escrow settlement"

# Commit 4: contract tests
git add contracts/invoice_registry/src/test.rs contracts/payment_manager/src/test.rs contracts/invoice_registry/test_snapshots/ contracts/payment_manager/test_snapshots/
git commit -m "test(contracts): add comprehensive unit tests for registry and payment contracts"

# Commit 5: network service
git add src/services/network.ts
git commit -m "feat(services): implement network configuration utility supporting testnet and simulator modes"

# Commit 6: wallet state service
git add src/services/wallet.ts
git commit -m "feat(services): implement wallet state provider supporting mock and web3 connector wallets"

# Commit 7: transactions service
git add src/services/transactions.ts
git commit -m "feat(services): build transaction history logs storage manager"

# Commit 8: core contract interaction and invoice services
git add src/services/contract.ts src/services/invoice.ts
git commit -m "feat(services): build core invoice execution service matching Soroban interfaces"

# Commit 9: useInvoiceX hook
git add src/hooks/useInvoiceX.tsx
git commit -m "feat(hooks): build useInvoiceX state coordinator hook"

# Commit 10: docs/architecture.md and README.md
git add docs/architecture.md README.md
git commit -m "docs: add technical architecture documentation and README"

# Commit 11: public/_redirects and netlify.toml
git add public/_redirects netlify.toml
git commit -m "chore: configure Netlify redirects and build settings for single page app routing"

# Commit 12: src/assets/hero.png
git add src/assets/hero.png
git commit -m "assets: add premium landing hero graphic illustration"

# Commit 13: src/App.tsx initial layout setup
git add src/App.tsx
git commit -m "feat(ui): implement core InvoiceX application dashboards, ledger, and detail modules"

# Commit 14: src/index.css
git add src/index.css
git commit -m "style: implement pitch-black dark mode and soft-grey light mode color systems"

# Commit 15: CI/CD workflows with locked flags, scripts, and test suite
git add -A
git commit -m "feat(ci): fix CI/CD pipelines, enforce locked builds, pin ed25519-dalek to 2.2.0"

# Force push to main
git remote add origin https://github.com/daman-21-deep/InvoiceX.git
git push -f -u origin main
