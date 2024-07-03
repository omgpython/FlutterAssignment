import 'dart:io';
void main() {
  stdout.write("Enter Year : ");
  int year = int.parse(stdin.readLineSync()!);

  if(year % 4 == 0) {
    print("$year is Leap Year");
  } else {
    print("$year is Not A Leap Year");
  }
}