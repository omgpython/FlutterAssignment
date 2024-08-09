import 'dart:io';

Map<String,double> account = {};
String accountNo = "0001";

String findAccount() {
  stdout.write("\nEnter Account No. : ");
  return stdin.readLineSync()!;
}

double enterBalance() {
  stdout.write("\nEnter Amount : ");
  return double.parse(stdin.readLineSync()!);
}

void addAccount() {
  double balance = enterBalance();
  int acno = int.parse(accountNo);

  if (balance < 0) {
    print("Please Enter Valid Amount");
  } else {
    account[accountNo] = balance;
    print("\nAccount Added \nAccount No. : $accountNo");

    if (acno <= 9) {
      accountNo = "000${acno += 1}";
    } else {
      accountNo = "00${acno += 1}";
    }
  }
}

void depositBalance() {
  String acno = findAccount();
  if(account.containsKey(acno)) {
    double depositBalance = enterBalance();

    if(depositBalance < 0) {
      print("Please Enter Valid Amount");
    } else {
      account[acno] = account[acno]! + depositBalance;
      print("Deposit Success");
    }
  } else {
    print("Please Check Account No.");
  }
}

void withdrawalBalance() {
  String acno = findAccount();


  if(account.containsKey(acno)) {
    double withdrawalBalance = enterBalance();
    double balance = account[acno]!;

    if (withdrawalBalance > 0) {
      if (withdrawalBalance < balance) {
        account[acno] = balance - withdrawalBalance;
        print("Withdrawal Success");
      } else {
        print("Insufficient Balance");
      }
    }
  } else {
    print("Please Check Account No.");
  }
}

void showBalance() {
  String acno = findAccount();
  if(account.containsKey(acno)) {
    print("\nAccount No. : $acno \nBalance : ${account[acno]}");
  } else {
    print("Please Check Account No. ");
  }
}

void main() {
  int ch;
  do {
    print("\n1. Add Account");
    print("2. Deposit Balance");
    print("3. Withdrawal Balance");
    print("4. Show Balance");
    print("5. Exit");
    stdout.write("Enter Your Choice : ");
    ch = int.parse(stdin.readLineSync()!);
    
    switch(ch) {
      case 1:
        addAccount();
        break;
      case 2:
        depositBalance();
        break;
      case 3:
        withdrawalBalance();
        break;
      case 4:
        showBalance();
        break;
      case 5:
        print("Exit....");
        break;
      default:
        print("Enter Valid Choice");
    }
    
  } while(ch != 5);
  
}