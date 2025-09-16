const readlineSync = require('readline-sync');

console.log('=== Interactive Demo ===');
console.log('This demo will test the main menu without full application logic');

let continueDemo = true;
while (continueDemo) {
    console.log('\n--------------------------------');
    console.log('Account Management System');
    console.log('1. View Balance');
    console.log('2. Credit Account');
    console.log('3. Debit Account'); 
    console.log('4. Exit');
    console.log('--------------------------------');
    
    const choice = readlineSync.question('Enter your choice (1-4): ');
    const userChoice = parseInt(choice);
    
    switch (userChoice) {
        case 1:
            console.log('Current balance: $1000.00');
            break;
        case 2:
            const creditAmount = readlineSync.question('Enter credit amount: ');
            console.log(`Amount credited. New balance: $${(1000 + parseFloat(creditAmount)).toFixed(2)}`);
            break;
        case 3:
            const debitAmount = readlineSync.question('Enter debit amount: ');
            console.log(`Amount debited. New balance: $${(1000 - parseFloat(debitAmount)).toFixed(2)}`);
            break;
        case 4:
            continueDemo = false;
            console.log('Exiting the program. Goodbye!');
            break;
        default:
            console.log('Invalid choice, please select 1-4.');
    }
}