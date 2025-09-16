# Account Management System - Node.js

This Node.js application is a modernized version of the legacy COBOL Account Management System. It preserves the original business logic, data integrity, and menu options while providing a modern JavaScript implementation.

## Architecture

The application follows the same three-tier architecture as the original COBOL system:

- **Presentation Layer**: `index.js` - User interface and menu system (equivalent to `main.cob`)
- **Business Logic Layer**: `AccountOperations.js` - Account operations and business rules (equivalent to `operations.cob`)
- **Data Layer**: `AccountData.js` - Data storage and retrieval operations (equivalent to `data.cob`)

## Features

- Interactive menu-driven interface
- View current account balance
- Credit account with amount validation
- Debit account with insufficient funds protection
- Input validation and error handling
- Clean program exit

## Prerequisites

- Node.js (version 12 or higher)
- npm (Node Package Manager)

## Installation

1. Navigate to the accounting directory:
   ```bash
   cd src/accounting
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

## Running the Application

### Command Line
```bash
npm start
```

or

```bash
node index.js
```

### VS Code Debugging
Use the provided `.vscode/launch.json` configuration:
1. Open VS Code in the repository root
2. Go to the Debug panel (Ctrl+Shift+D)
3. Select "Run Account Management System" or "Debug Account Management System"
4. Press F5 to start

## Usage

1. Start the application
2. Choose from the menu options:
   - **1**: View Balance - Display current account balance
   - **2**: Credit Account - Add funds to the account
   - **3**: Debit Account - Remove funds from the account (with validation)
   - **4**: Exit - Safely terminate the program

3. Follow the prompts for credit/debit operations
4. Invalid menu choices will display an error message

## Business Rules

- Initial account balance: $1,000.00
- Credit operations: Add positive amounts to the balance
- Debit operations: Subtract amounts only if sufficient funds are available
- Insufficient funds: Prevent overdrafts with clear error messages
- Input validation: Ensure amounts are positive numbers

## Original COBOL Mapping

| COBOL File | Node.js File | Purpose |
|------------|--------------|---------|
| `main.cob` | `index.js` | Main program loop and menu system |
| `operations.cob` | `AccountOperations.js` | Business logic for account operations |
| `data.cob` | `AccountData.js` | Data storage and retrieval |

## Dependencies

- `readline-sync`: For synchronous user input (similar to COBOL ACCEPT/DISPLAY)

## Development

The application maintains the same program flow and data patterns as the original COBOL system:

1. **Startup**: Initialize with menu display
2. **User Selection**: Process menu choices (1-4)
3. **Operation Routing**: Delegate to appropriate business logic
4. **Data Access**: Handle read/write operations
5. **User Feedback**: Display results and continue loop
6. **Clean Exit**: Terminate with goodbye message