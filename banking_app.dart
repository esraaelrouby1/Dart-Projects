import 'dart:io';

void main() {
  // 1-Account Initialization
  double accountBalance = 1000.0;

  // Authentication

  const String accountPIN = "1234";
  int failedAttempts = 0;
  //Limit the number of failed attempts to 3 before the program exits.
  const int maxAttempts = 3;

  while (true) {
    stdout.write("Enter your PIN: ");
    String? enteredPIN = stdin.readLineSync();

    if (enteredPIN == accountPIN) {
      print("\nAccess granted!\n");
      break;
    } else {
      failedAttempts++;
      print(
          "Incorrect PIN. (${maxAttempts - failedAttempts} attempts remaining)\n");

      if (failedAttempts >= maxAttempts) {
        print("Maximum attempts reached. Exiting program.");
        return;
      }
    }
  }

  // Banking Application Menu
  while (true) {
    //Display a menu with the following options
    print("Banking Application Menu:");
    print("1. Check Balance");
    print("2. Deposit Money");
    print("3. Withdraw Money");
    print("4. Exit");

//Prompt the user to enter their choice.
    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      //Check Balance:
      case '1':
        print(
            "\nYour current balance is: \$${accountBalance.toStringAsFixed(2)}\n");
        break;
      //Deposit Money
      case '2':
        stdout.write("Enter the amount to deposit: ");
        String? depositInput = stdin.readLineSync();
        double? depositAmount = double.tryParse(depositInput ?? "");

        //Ensure the deposit amount is positive.
        if (depositAmount != null && depositAmount > 0) {
          accountBalance += depositAmount;
          print(
              "\nSuccessfully deposited \$${depositAmount.toStringAsFixed(2)}.\nYour new balance is: \$${accountBalance.toStringAsFixed(2)}\n");
        } else {
          print("\nInvalid deposit amount. Please enter a positive number.\n");
        }
        break;
      //Withdraw Money
      case '3':
        stdout.write("Enter the amount to withdraw: ");
        String? withdrawInput = stdin.readLineSync();
        double? withdrawAmount = double.tryParse(withdrawInput ?? "");

        //Check if the account has sufficient funds.

        if (withdrawAmount != null && withdrawAmount > 0) {
          //If sufficient, deduct the amount from the balance.
          if (withdrawAmount <= accountBalance) {
            accountBalance -= withdrawAmount;
            print(
                "\nSuccessfully withdrew \$${withdrawAmount.toStringAsFixed(2)}.\nYour new balance is: \$${accountBalance.toStringAsFixed(2)}\n");
          } else {
            print(
                "\nInsufficient funds. Your current balance is: \$${accountBalance.toStringAsFixed(2)}\n");
          }
        } else {
          print(
              "\nInvalid withdrawal amount. Please enter a positive number.\n");
        }
        break;
      //Exit:
      case '4':
        print("\nThank you for using the banking application. Goodbye!\n");
        return;

      default:
        print("\nInvalid choice. Please select a valid option.\n");
    }
  }
}
