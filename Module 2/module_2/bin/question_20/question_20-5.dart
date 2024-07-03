import 'dart:io';

void main() {
  stdout.write("Enter Number : ");
  int n = int.parse(stdin.readLineSync()!);
  int no1 = 0,no2 = 1;
  stdout.write("$no1 $no2");
  for(int i = 1;i <= n;i++) {
    int temp = no1 + no2;
    stdout.write(" $temp");
    no1 = no2;
    no2 = temp;
  }
}