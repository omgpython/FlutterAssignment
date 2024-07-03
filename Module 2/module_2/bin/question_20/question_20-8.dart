import 'dart:io';

void main() {
  stdout.write("Enter Number : ");
  int number = int.parse(stdin.readLineSync()!);

  String num = number.toString();
  int max = 0;
  for(int i = 0;i < num.length;i++) {
    int temp = int.parse(num[i]);
    if(temp > max) {
      max = temp;
    }
  }
  print("Max Number : $max");
}