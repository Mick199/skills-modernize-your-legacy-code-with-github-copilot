/**
 * AccountData class - Equivalent to data.cob DataProgram
 * Handles all data storage and retrieval operations for account balances
 */
class AccountData {
    constructor() {
        // Initial balance equivalent to STORAGE-BALANCE PIC 9(6)V99 VALUE 1000.00
        this.storageBalance = 1000.00;
    }

    /**
     * Performs read or write operations on the balance
     * @param {string} operation - 'read' or 'write'
     * @param {number} balance - balance value (used for write operations)
     * @returns {number} - current balance (for read operations)
     */
    performOperation(operation, balance = null) {
        const operationType = operation.toLowerCase().trim();

        if (operationType === 'read') {
            // Equivalent to: MOVE STORAGE-BALANCE TO BALANCE
            return this.storageBalance;
        } else if (operationType === 'write') {
            // Equivalent to: MOVE BALANCE TO STORAGE-BALANCE
            if (balance !== null && balance !== undefined) {
                this.storageBalance = balance;
            }
            return this.storageBalance;
        }

        throw new Error(`Invalid operation type: ${operation}`);
    }

    /**
     * Get current balance (read operation)
     * @returns {number} current balance
     */
    getBalance() {
        return this.performOperation('read');
    }

    /**
     * Set new balance (write operation)
     * @param {number} newBalance - new balance to set
     */
    setBalance(newBalance) {
        this.performOperation('write', newBalance);
    }
}

module.exports = AccountData;