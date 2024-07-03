import 'dart:io';

void main() {
  stdout.write("Enter Number : ");
  int number = int.parse(stdin.readLineSync()!);
  String num = number.toString();

  stdout.write("Reverse Number : ");
  for(int i = num.length-1;i >= 0;i--) {
    stdout.write(num[i]);
  }
}