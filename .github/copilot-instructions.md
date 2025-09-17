# COBOL Account Management System - GitHub Copilot Instructions

**ALWAYS follow these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.**

## System Overview

This is a legacy COBOL account management system that implements a simple banking interface with menu-driven operations. The system consists of three modular COBOL programs following a three-tier architecture:
- **Presentation Layer**: `src/cobol/main.cob` - User interface and menu system
- **Business Logic Layer**: `src/cobol/operations.cob` - Account operations and business rules  
- **Data Layer**: `src/cobol/data.cob` - Data storage and retrieval operations

## Working Effectively

### Environment Setup
Install the GnuCOBOL compiler (required for building):
```bash
sudo apt-get update && sudo apt-get install -y gnucobol
```

### Building the Application
Navigate to the COBOL source directory and compile:
```bash
cd src/cobol
cobc -x -o account-management main.cob operations.cob data.cob
```
- **Build time**: Under 2 seconds. NEVER CANCEL - set timeout to 30+ seconds.
- **Output**: Creates executable `account-management` (~102KB ELF binary)
- **Warnings**: Expect "_FORTIFY_SOURCE" redefined warnings (normal, not errors)

### Running the Application
Execute the compiled program:
```bash
cd src/cobol
./account-management
```

## Validation and Testing

### CRITICAL: Manual Validation Requirements
**ALWAYS run through these complete end-to-end scenarios after making changes:**

#### Scenario 1: Complete Transaction Flow
1. Start application: `./account-management`
2. View initial balance: Enter `1` → Should show "Current balance: 001000.00"
3. Credit account: Enter `2` → Input `100` → Should show "Amount credited. New balance: 001100.00"
4. Debit account: Enter `3` → Input `50` → Should show "Amount debited. New balance: 001050.00" 
5. View final balance: Enter `1` → Should show "Current balance: 001050.00"
6. Exit: Enter `4` → Should show "Exiting the program. Goodbye!"

#### Scenario 2: Insufficient Funds Validation
1. Start application: `./account-management`
2. Attempt large debit: Enter `3` → Input `2000` → Should show "Insufficient funds for this debit."
3. Verify balance unchanged: Enter `1` → Should show "Current balance: 001000.00"
4. Exit: Enter `4`

#### Scenario 3: Invalid Input Handling
1. Start application: `./account-management`
2. Test invalid menu option: Enter `5` → Should show "Invalid choice, please select 1-4."
3. Exit: Enter `4`

### Testing Input Interaction
The application requires interactive input. Use these commands for automated testing:
```bash
# Example: Automated test sequence
echo -e "1\n2\n100\n3\n50\n1\n4" | ./account-management
```

## Repository Structure and Key Files

### Source Code (`src/cobol/`)
- **`main.cob`**: Entry point, menu system, user input handling
- **`operations.cob`**: Business logic, transaction processing, validation
- **`data.cob`**: Data persistence layer, balance storage (in-memory)

### Documentation (`docs/`)
- **`docs/README.md`**: Comprehensive system documentation with architecture diagrams

### Scripts and Automation
- **`create_github_issues.sh`**: Creates GitHub issues from user stories (requires `gh auth login`)
- **`scripts/create_github_issues.sh`**: Alternative issue creation script  
- **`generated-issues/`**: Pre-generated GitHub issue templates

### Configuration
- **`.devcontainer/`**: VS Code dev container with COBOL support and GitHub Copilot
- **`.github/workflows/`**: GitHub Actions for exercise validation

## Build Constraints and Limitations

### No Additional Build Systems
- **NO npm, yarn, pip, make, gradle, or other build tools** - this is pure COBOL
- **NO package.json, Makefile, requirements.txt** - only COBOL source files
- **NO automated test suite** - validation is done through manual execution

### Development Environment
- Uses GnuCOBOL compiler (open source COBOL implementation)
- Compatible with standard COBOL syntax and features
- Supports PIC 9 (numeric) and PIC X (alphanumeric) data types

## Data and Business Rules

### Account Balance Management
- **Initial balance**: $1,000.00 (stored as 001000.00 in COBOL format)
- **Data persistence**: In-memory only (resets to $1,000.00 on restart)
- **Insufficient funds**: Prevents debits that would result in negative balance

### Input Validation
- Menu accepts only choices 1-4
- Credit/debit amounts accept numeric input (PIC 9(6)V99 format)
- Invalid menu choices display error message and re-prompt

## Common Development Tasks

### Making Code Changes
1. Always backup the current working executable before changes
2. Edit COBOL source files (.cob)
3. Recompile with: `cobc -x -o account-management main.cob operations.cob data.cob`
4. **ALWAYS validate with complete scenarios** before committing
5. Test both success paths and error conditions

### Debugging COBOL Issues
- Check COBOL syntax: Use `cobc -fsyntax-only filename.cob`
- Verify program linkage: Ensure CALL statements match PROGRAM-ID names
- Data type issues: Verify PIC clauses match expected data formats
- Program flow: Check EVALUATE and IF-ELSE logic blocks

### GitHub Integration
- Use provided scripts for issue creation if GitHub CLI is configured
- Review `.github/workflows/` for automated validation requirements
- Check for exercise-specific requirements in workflow files

## Error Prevention

### NEVER Cancel Commands
- Build commands complete in under 5 seconds - wait for completion
- Application requires user interaction - do not force-quit during testing

### Always Validate Changes
- **CRITICAL**: Run complete validation scenarios after any code modification
- Test both positive and negative cases (sufficient/insufficient funds)
- Verify menu navigation and error handling work correctly
- Ensure application exits cleanly with option 4

### Common Pitfalls
- Do not modify program structure without understanding CALL relationships
- Do not change PIC clauses without verifying data compatibility  
- Do not skip manual validation - there are no automated tests
- Remember: balance resets to $1,000.00 on each program restart

## Timeout Recommendations

- **Build commands**: 30 seconds (actual: ~2 seconds)
- **Application startup**: 10 seconds  
- **Interactive testing**: Allow 60+ seconds for complete scenario validation
- **NEVER CANCEL any build or test operation** - let them complete

## Quick Reference

### Essential Commands
```bash
# Build application
cd src/cobol && cobc -x -o account-management main.cob operations.cob data.cob

# Run application  
cd src/cobol && ./account-management

# Quick validation test
cd src/cobol && echo -e "1\n4" | ./account-management
```

### File Locations
- Source: `/src/cobol/*.cob`
- Executable: `/src/cobol/account-management`
- Documentation: `/docs/README.md`
- Issues: `/generated-issues/`