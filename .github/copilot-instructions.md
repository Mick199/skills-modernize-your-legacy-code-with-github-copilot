# Legacy COBOL Banking System Modernization

This repository contains a legacy COBOL banking/account management system designed to be modernized using GitHub Copilot. The system currently implements basic account operations (balance inquiry, credit, debit) in COBOL and the goal is to convert it to modern JavaScript.

**ALWAYS follow these instructions first and only search or run bash commands when you encounter unexpected information that contradicts what is documented here.**

## Working Effectively

### Environment Setup
The repository includes a devcontainer with all necessary tools pre-installed:
- **GnuCOBOL compiler** (cobc) - for building the legacy COBOL system
- **Node.js LTS** with pnpm and nvm - for JavaScript modernization
- **GitHub CLI (gh)** - for issue management and repository operations
- **VS Code extensions** - GitHub Copilot, ESLint, Markdown support, COBOL language support

### Building and Running the Legacy COBOL System

**ALWAYS start by understanding the current system before making modernization changes.**

#### 1. Install Dependencies (if not in devcontainer)
```bash
sudo apt-get update && sudo apt-get install -y gnucobol
```

#### 2. Build the COBOL Application
```bash
cd src/cobol
cobc -x -o account_system main.cob operations.cob data.cob
```
- **Build time**: ~0.15 seconds (very fast)
- **NEVER CANCEL**: Although builds are fast, always wait for completion
- **Expected warnings**: `_FORTIFY_SOURCE` redefined warnings are normal and can be ignored

#### 3. Run the COBOL Application
```bash
cd src/cobol
./account_system
```

### Manual Validation Scenarios

**ALWAYS run through these complete scenarios after making any changes to verify functionality:**

#### Scenario 1: Basic Account Operations
1. Start the application: `./account_system`
2. Test View Balance: Select option `1` → Should show `Current balance: 001000.00`
3. Test Credit Account: Select option `2` → Enter amount `100` → Should show `Amount credited. New balance: 001100.00`
4. Test View Balance Again: Select option `1` → Should show `Current balance: 001100.00`
5. Test Debit Account: Select option `3` → Enter amount `50` → Should show `Amount debited. New balance: 001050.00`
6. Test Insufficient Funds: Select option `3` → Enter amount `2000` → Should show `Insufficient funds for this debit.`
7. Exit Application: Select option `4` → Should show `Exiting the program. Goodbye!`

#### Scenario 2: Invalid Input Handling
1. Start the application: `./account_system`
2. Test Invalid Menu Choice: Enter `5` → Should show `Invalid choice, please select 1-4.`
3. Test Invalid Menu Choice: Enter `0` → Should show `Invalid choice, please select 1-4.`
4. Exit Application: Select option `4`

**Critical**: The application must handle all these scenarios correctly before and after modernization.

## System Architecture

### Current COBOL Implementation
The system consists of three modular COBOL programs:

- **`main.cob`** (MainProgram) - User interface and menu system
- **`operations.cob`** (Operations) - Business logic for account operations
- **`data.cob`** (DataProgram) - Data storage and retrieval layer

### Key Business Rules
1. **Initial Balance**: All accounts start with $1,000.00
2. **Credit Operations**: No upper limit validation (accepts any positive amount)
3. **Debit Operations**: Prevents overdrafts - cannot debit more than available balance
4. **Data Persistence**: Currently uses working storage (data lost on program exit)
5. **Single Account**: System manages only one account at a time

## Modernization Target

### Expected JavaScript Structure
The modernization goal is to convert the COBOL system to JavaScript. The GitHub workflow expects:

**Target file**: `src/accounting/index.js`
**Required keywords**: The file must contain both `'credit'` and `'debit'` keywords for CI validation to pass.

### Validation Requirements
After modernization, ALWAYS ensure:
1. The JavaScript version maintains the same business logic as COBOL
2. All manual validation scenarios work identically
3. The file contains required keywords for CI: `credit` and `debit`
4. No functionality is lost in translation

## GitHub Issue Management

### Automated Issue Creation
The repository includes scripts to create user story issues for modernization planning:

```bash
# Requires GitHub CLI authentication first
gh auth login

# Then create all 12 user story issues automatically
./create_github_issues.sh
```

### Manual Issue Creation
If automated creation fails:
```bash
# View the manual creation guide
./manual_issue_creation_guide.sh

# Or refer to generated-issues/ directory for individual issue files
```

### Issue Management Features
- **12 user stories** defined for system enhancement
- **5 epics**: User Authentication & Security, Enhanced Account Features, Reporting & Analytics, System Administration, System Modernization
- **Labels**: enhancement, security, feature, reporting, infrastructure, ui, mobile, api
- **Priorities**: High (4 issues), Medium (5 issues), Low (3 issues)

## Development Workflow

### Before Making Changes
1. **Build and test the COBOL system** to understand current behavior
2. **Run all manual validation scenarios** to establish baseline
3. **Review documentation** in `docs/README.md` for detailed system specifications

### During Development
1. **Make incremental changes** and test frequently
2. **Maintain business logic parity** between COBOL and modernized versions
3. **Test after each change** using the validation scenarios

### After Making Changes
1. **Build and test** both old and new versions if applicable
2. **Run complete validation scenarios** on modernized system
3. **Verify CI requirements** are met (keywords present in target files)

## Common Commands Reference

### Repository Navigation
```bash
# View repository structure
ls -la

# Key directories:
# src/cobol/           - Legacy COBOL source code
# src/accounting/      - Target directory for JavaScript modernization
# docs/                - Comprehensive system documentation
# generated-issues/    - User story templates and issue creation tools
# .github/workflows/   - CI/CD workflows for the exercise
```

### COBOL Development
```bash
# Compile COBOL programs (always run from src/cobol/)
cd src/cobol
cobc -x -o account_system main.cob operations.cob data.cob

# Run the application
./account_system

# View COBOL source files
cat main.cob      # User interface and menu system
cat operations.cob # Business logic and account operations  
cat data.cob      # Data storage and retrieval operations
```

### Documentation
```bash
# View comprehensive system documentation
cat docs/README.md

# View user stories and requirements
cat github-issues-template.md

# View issue creation summary
cat ISSUE_CREATION_SUMMARY.md
```

## Important Notes

### Build Performance
- **COBOL compilation**: ~0.15 seconds (very fast)
- **No timeout concerns**: Builds complete almost instantly
- **NEVER CANCEL**: Always wait for builds to complete even though they're fast

### Data Limitations
- **No persistence**: Account data is lost when COBOL program exits
- **Single account**: System manages only one account at a time
- **No transaction history**: No audit trail or logging implemented
- **No authentication**: No user security features

### Modernization Priorities
When modernizing, focus on maintaining:
1. **Functional parity** - All current operations must work identically
2. **Business rule compliance** - Insufficient funds prevention, balance validation
3. **User experience** - Menu-driven interface translated to appropriate modern UI
4. **Data integrity** - Accurate balance calculations and transaction processing

## Troubleshooting

### COBOL Compilation Issues
- Ensure you're in `src/cobol/` directory when building
- `_FORTIFY_SOURCE` warnings are normal and can be ignored
- Missing `cobc` command means GnuCOBOL not installed: `sudo apt-get install -y gnucobol`

### Application Runtime Issues
- Program stuck at menu: User input required, enter choice 1-4
- Invalid choice messages: Expected behavior for inputs outside 1-4 range
- Insufficient funds message: Expected behavior when debit amount exceeds balance

### GitHub CLI Issues
- Authentication required: Run `gh auth login` before using issue creation scripts
- API rate limits: Wait and retry if scripts fail due to rate limiting

This system is designed as a learning exercise for modernizing legacy code with GitHub Copilot. Always maintain the core functionality while applying modern development practices and technologies.