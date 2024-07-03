import 'dart:io';

void main() {
  stdout.write("Enter Number : ");
  int number = int.parse(stdin.readLineSync()!);

  String num = number.toString();
  int sum = 0;
  sum = sum + int.parse(num[0]);
  sum = sum + int.parse(num[num.length-1]);

  print("Sum of First And Last Digit : $sum");
}