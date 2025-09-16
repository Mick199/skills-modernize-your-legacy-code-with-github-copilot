const readlineSync = require('readline-sync');

/**
 * AccountOperations class - Equivalent to operations.cob Operations program
 * Implements the core business logic for account operations
 */
class AccountOperations {
    constructor(dataProgram) {
        this.dataProgram = dataProgram;
    }

    /**
     * Processes operations based on operation type
     * @param {string} operationType - 'TOTAL', 'CREDIT', or 'DEBIT'
     */
    processOperation(operationType) {
        const operation = operationType.trim().toUpperCase();

        switch (operation) {
            case 'TOTAL':
                this.viewBalance();
                break;
            case 'CREDIT':
                this.creditAccount();
                break;
            case 'DEBIT':
                this.debitAccount();
                break;
            default:
                console.log(`Unknown operation: ${operationType}`);
        }
    }

    /**
     * View current balance - equivalent to TOTAL operation
     */
    viewBalance() {
        // Equivalent to: CALL 'DataProgram' USING 'read', FINAL-BALANCE
        const currentBalance = this.dataProgram.getBalance();
        
        // Equivalent to: DISPLAY "Current balance: " FINAL-BALANCE
        console.log(`Current balance: $${currentBalance.toFixed(2)}`);
    }

    /**
     * Credit account - equivalent to CREDIT operation
     */
    creditAccount() {
        // Equivalent to: DISPLAY "Enter credit amount: "
        console.log('Enter credit amount: ');
        
        // Equivalent to: ACCEPT AMOUNT
        const amountInput = readlineSync.question('');
        const amount = parseFloat(amountInput);

        // Input validation
        if (isNaN(amount) || amount <= 0) {
            console.log('Invalid amount. Please enter a positive number.');
            return;
        }

        // Equivalent to: CALL 'DataProgram' USING 'read', FINAL-BALANCE
        const currentBalance = this.dataProgram.getBalance();
        
        // Equivalent to: ADD AMOUNT TO FINAL-BALANCE
        const newBalance = currentBalance + amount;
        
        // Equivalent to: CALL 'DataProgram' USING 'write', FINAL-BALANCE
        this.dataProgram.setBalance(newBalance);
        
        // Equivalent to: DISPLAY "Amount credited. New balance: " FINAL-BALANCE
        console.log(`Amount credited. New balance: $${newBalance.toFixed(2)}`);
    }

    /**
     * Debit account - equivalent to DEBIT operation
     */
    debitAccount() {
        // Equivalent to: DISPLAY "Enter debit amount: "
        console.log('Enter debit amount: ');
        
        // Equivalent to: ACCEPT AMOUNT
        const amountInput = readlineSync.question('');
        const amount = parseFloat(amountInput);

        // Input validation
        if (isNaN(amount) || amount <= 0) {
            console.log('Invalid amount. Please enter a positive number.');
            return;
        }

        // Equivalent to: CALL 'DataProgram' USING 'read', FINAL-BALANCE
        const currentBalance = this.dataProgram.getBalance();
        
        // Equivalent to: IF FINAL-BALANCE >= AMOUNT
        if (currentBalance >= amount) {
            // Equivalent to: SUBTRACT AMOUNT FROM FINAL-BALANCE
            const newBalance = currentBalance - amount;
            
            // Equivalent to: CALL 'DataProgram' USING 'write', FINAL-BALANCE
            this.dataProgram.setBalance(newBalance);
            
            // Equivalent to: DISPLAY "Amount debited. New balance: " FINAL-BALANCE
            console.log(`Amount debited. New balance: $${newBalance.toFixed(2)}`);
        } else {
            // Equivalent to: DISPLAY "Insufficient funds for this debit."
            console.log('Insufficient funds for this debit.');
        }
    }
}

module.exports = AccountOperations;