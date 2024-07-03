import 'dart:io';

void main() {
  int fact = 1;
  stdout.write("Enter Number : ");
  int number = int.parse(stdin.readLineSync()!);

  for(int i = 1; i <= number; i++) {
    fact = fact * i;
  }

  print("Factorial of $number : $fact");
}