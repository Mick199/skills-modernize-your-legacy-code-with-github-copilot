const readlineSync = require('readline-sync');
const AccountData = require('./AccountData');
const AccountOperations = require('./AccountOperations');

/**
 * Main program - Equivalent to main.cob MainProgram
 * Serves as the primary entry point and user interface for the account management system
 */
class AccountManagementSystem {
    constructor() {
        // Initialize data and operations layers
        this.dataProgram = new AccountData();
        this.operations = new AccountOperations(this.dataProgram);
        
        // Equivalent to CONTINUE-FLAG PIC X(3) VALUE 'YES'
        this.continueFlag = true;
    }

    /**
     * Display the main menu
     */
    displayMenu() {
        console.log('--------------------------------');
        console.log('Account Management System');
        console.log('1. View Balance');
        console.log('2. Credit Account');
        console.log('3. Debit Account');
        console.log('4. Exit');
        console.log('--------------------------------');
    }

    /**
     * Get user choice with input validation
     * @returns {number} user choice (1-4)
     */
    getUserChoice() {
        const choice = readlineSync.question('Enter your choice (1-4): ');
        const userChoice = parseInt(choice);
        
        // Return the choice for evaluation, validation handled in main logic
        return userChoice;
    }

    /**
     * Main logic loop - equivalent to MAIN-LOGIC in main.cob
     */
    run() {
        // Equivalent to: PERFORM UNTIL CONTINUE-FLAG = 'NO'
        while (this.continueFlag) {
            this.displayMenu();
            
            // Equivalent to: ACCEPT USER-CHOICE
            const userChoice = this.getUserChoice();

            // Equivalent to: EVALUATE USER-CHOICE
            switch (userChoice) {
                case 1:
                    // Equivalent to: CALL 'Operations' USING 'TOTAL '
                    this.operations.processOperation('TOTAL');
                    break;
                case 2:
                    // Equivalent to: CALL 'Operations' USING 'CREDIT'
                    this.operations.processOperation('CREDIT');
                    break;
                case 3:
                    // Equivalent to: CALL 'Operations' USING 'DEBIT '
                    this.operations.processOperation('DEBIT');
                    break;
                case 4:
                    // Equivalent to: MOVE 'NO' TO CONTINUE-FLAG
                    this.continueFlag = false;
                    break;
                default:
                    // Equivalent to: DISPLAY "Invalid choice, please select 1-4."
                    console.log('Invalid choice, please select 1-4.');
            }
            
            // Add a blank line for readability between operations
            if (this.continueFlag) {
                console.log('');
            }
        }

        // Equivalent to: DISPLAY "Exiting the program. Goodbye!"
        console.log('Exiting the program. Goodbye!');
    }
}

/**
 * Application entry point
 */
function main() {
    try {
        const app = new AccountManagementSystem();
        app.run();
    } catch (error) {
        console.error('An error occurred:', error.message);
        process.exit(1);
    }
}

// Start the application if this file is run directly
if (require.main === module) {
    main();
}

module.exports = AccountManagementSystem;