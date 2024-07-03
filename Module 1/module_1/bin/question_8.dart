import 'dart:io';

void main() {

  stdout.write("Enter marks of subject 1 : ");
  int sub1 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter marks of subject 2 : ");
  int sub2 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter marks of subject 3 : ");
  int sub3 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter marks of subject 4 : ");
  int sub4 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter marks of subject 5 : ");
  int sub5 = int.parse(stdin.readLineSync()!);


  int total = sub1 + sub2 + sub3 + sub4 + sub5;
  double per = (total * 100) / 500;

  print("Total marks is : $total");
  print("Percentage is : $per");
}