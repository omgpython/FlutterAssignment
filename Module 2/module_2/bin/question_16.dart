import 'dart:io';

void main() {
  stdout.write("Enter Marks Of Subject 1 : ");
  int marks1 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Marks Of Subject 2 : ");
  int marks2 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Marks Of Subject 3 : ");
  int marks3 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Marks Of Subject 4 : ");
  int marks4 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Marks Of Subject 5 : ");
  int marks5 = int.parse(stdin.readLineSync()!);

  int total = marks1 + marks2 + marks3 + marks4 + marks5;
  double per = (total / 500) * 100;

  if(marks1 >= 35 && marks2 >= 35 && marks3 >= 35 && marks4 >= 35 && marks5 >= 35) {
    print("Result : Pass");
    print("Total Marks : $total");
    print("Percentage : $per");
    if(per > 75) {
      print("Grade : Distinction");
    } else if(per > 60 && per <= 75) {
      print("Grade : First Class");
    } else if(per > 50) {
      print("Grade : Second Class");
    } else {
      print("Grade : Pass Class");
    }
  } else {
    print("Result : Fail");
    print("Total Marks : $total");
    print("Percentage : $per");
  }
}