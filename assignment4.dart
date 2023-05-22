abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      balance += balance * interestRate;
    } else {
      print("Insufficient funds!");
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
    } else {
      print("Insufficient funds!");
    }
  }
}

void main() {
  var savingsAcc = SavingsAccount(12345, 1000.0, 0.05);
  savingsAcc.deposit(500.0);
  savingsAcc.withdraw(200.0);

  var currentAcc = CurrentAccount(54321, 2000.0, 1000.0);
  currentAcc.deposit(300.0);
  currentAcc.withdraw(2500.0);
}y