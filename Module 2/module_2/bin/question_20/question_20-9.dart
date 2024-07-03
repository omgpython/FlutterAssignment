import 'dart:io';

void main() {
  stdout.write("Enter Number : ");
  int number = int.parse(stdin.readLineSync()!);

  String num = number.toString();
  int sum = 0;
  for(int i = 0;i < num.length;i++) {
    sum = sum + int.parse(num[i]);
  }
  print("Sum : $sum");
}