// Node.js implementation of the COBOL accounting system
// Preserves business logic, data integrity, and menu options

const fs = require('fs');
const readline = require('readline');
const BALANCE_FILE = './balance.json';

// Initialize balance file if not present
function initBalance() {
  if (!fs.existsSync(BALANCE_FILE)) {
    fs.writeFileSync(BALANCE_FILE, JSON.stringify({ balance: 1000.00 }));
  }
}

function readBalance() {
  const data = fs.readFileSync(BALANCE_FILE, 'utf8');
  return JSON.parse(data).balance;
}

function writeBalance(newBalance) {
  fs.writeFileSync(BALANCE_FILE, JSON.stringify({ balance: newBalance }));
}

async function mainMenu() {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  let continueFlag = true;

  while (continueFlag) {
    console.log('--------------------------------');
    console.log('Account Management System');
    console.log('1. View Balance');
    console.log('2. Credit Account');
    console.log('3. Debit Account');
    console.log('4. Exit');
    console.log('--------------------------------');
    const choice = await new Promise(resolve => {
      rl.question('Enter your choice (1-4): ', answer => resolve(answer.trim()));
    });

    switch (choice) {
      case '1':
        handleTotal();
        break;
      case '2':
        await handleCredit(rl);
        break;
      case '3':
        await handleDebit(rl);
        break;
      case '4':
        continueFlag = false;
        console.log('Exiting the program. Goodbye!');
        break;
      default:
        console.log('Invalid choice, please select 1-4.');
    }
  }
  rl.close();
}

function handleTotal() {
  const balance = readBalance();
  console.log(`Current balance: ${balance.toFixed(2)}`);
}

async function handleCredit(rl) {
  const amount = await new Promise(resolve => {
    rl.question('Enter credit amount: ', answer => resolve(parseFloat(answer.trim())));
  });
  if (isNaN(amount) || amount < 0) {
    console.log('Invalid amount.');
    return;
  }
  let balance = readBalance();
  balance += amount;
  writeBalance(balance);
  console.log(`Amount credited. New balance: ${balance.toFixed(2)}`);
}

async function handleDebit(rl) {
  const amount = await new Promise(resolve => {
    rl.question('Enter debit amount: ', answer => resolve(parseFloat(answer.trim())));
  });
  if (isNaN(amount) || amount < 0) {
    console.log('Invalid amount.');
    return;
  }
  let balance = readBalance();
  if (balance >= amount) {
    balance -= amount;
    writeBalance(balance);
    console.log(`Amount debited. New balance: ${balance.toFixed(2)}`);
  } else {
    console.log('Insufficient funds for this debit.');
  }
}

// Export functions for testing
module.exports = {
  handleTotal,
  handleCredit,
  handleDebit,
  readBalance,
  writeBalance,
  initBalance,
  mainMenu
};

// Only run CLI if called directly
if (require.main === module) {
  initBalance();
  mainMenu();
}
