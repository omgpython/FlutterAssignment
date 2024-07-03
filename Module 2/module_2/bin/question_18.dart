import 'dart:io';

void main() {
  int ch = 0;
  do {
    print("\n1. Addition");
    print("2. Subtraction");
    print("3. Multiplication");
    print("4. Division");
    print("5. Exit");
    stdout.write("Enter Your Choice : ");
    ch = int.parse(stdin.readLineSync()!);

    switch(ch) {
      case 1:
        stdout.write("Enter No.1 : ");
        int no1 = int.parse(stdin.readLineSync()!);
        stdout.write("Enter No.2 : ");
        int no2 = int.parse(stdin.readLineSync()!);
        print("Addition of $no1 and $no2 is ${no1 + no2}");
        break;
      case 2:
        stdout.write("Enter No.1 : ");
        int no1 = int.parse(stdin.readLineSync()!);
        stdout.write("Enter No.2 : ");
        int no2 = int.parse(stdin.readLineSync()!);
        print("Subtraction of $no1 and $no2 is ${no1 - no2}");
        break;
      case 3:
        stdout.write("Enter No.1 : ");
        int no1 = int.parse(stdin.readLineSync()!);
        stdout.write("Enter No.2 : ");
        int no2 = int.parse(stdin.readLineSync()!);
        print("Multiplication of $no1 and $no2 is ${no1 * no2}");
        break;
      case 4:
        stdout.write("Enter No.1 : ");
        int no1 = int.parse(stdin.readLineSync()!);
        stdout.write("Enter No.2 : ");
        int no2 = int.parse(stdin.readLineSync()!);
        print("Division of $no1 and $no2 is ${no1 / no2}");
        break;
      case 5:
        print("Exit..");
        break;
      default:
        print("Enter Valid Input!!");
    }
  } while(ch != 5);
}