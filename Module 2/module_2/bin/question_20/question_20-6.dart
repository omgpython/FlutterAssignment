import 'dart:io';

void main() {
  stdout.write("Enter No. to print table : ");
  int table = int.parse(stdin.readLineSync()!);

  for(int i = 1;i <= 10;i++) {
    print("$table X $i = ${table * i}");
  }
}