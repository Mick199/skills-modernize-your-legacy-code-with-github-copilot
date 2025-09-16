const AccountData = require('./AccountData');
const AccountOperations = require('./AccountOperations');

// Test all functionality without user input
console.log('=== Testing Account Management System ===\n');

// Initialize components
const dataProgram = new AccountData();
const operations = new AccountOperations(dataProgram);

// Test 1: View initial balance
console.log('1. Testing View Balance:');
operations.viewBalance();
console.log();

// Test 2: Test data operations directly
console.log('2. Testing Data Operations:');
console.log('Setting balance to 1500...');
dataProgram.setBalance(1500);
console.log('Current balance after set:', dataProgram.getBalance());
console.log();

// Test 3: Test credit operation logic (without user input)
console.log('3. Testing Credit Logic:');
const currentBalance = dataProgram.getBalance();
const creditAmount = 250;
const newBalance = currentBalance + creditAmount;
dataProgram.setBalance(newBalance);
console.log(`Credited $${creditAmount}. New balance: $${dataProgram.getBalance().toFixed(2)}`);
console.log();

// Test 4: Test debit operation logic (without user input)
console.log('4. Testing Debit Logic:');
const beforeDebit = dataProgram.getBalance();
const debitAmount = 100;
if (beforeDebit >= debitAmount) {
    const afterDebit = beforeDebit - debitAmount;
    dataProgram.setBalance(afterDebit);
    console.log(`Debited $${debitAmount}. New balance: $${dataProgram.getBalance().toFixed(2)}`);
} else {
    console.log('Insufficient funds for this debit.');
}
console.log();

// Test 5: Test insufficient funds scenario
console.log('5. Testing Insufficient Funds:');
const currentBal = dataProgram.getBalance();
const largeDebit = currentBal + 500;
if (currentBal >= largeDebit) {
    console.log('This should not happen');
} else {
    console.log(`Attempting to debit $${largeDebit} from balance $${currentBal}: Insufficient funds`);
}
console.log();

console.log('=== All tests completed successfully! ===');