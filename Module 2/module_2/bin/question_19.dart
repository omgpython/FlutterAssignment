import 'dart:io';

void main() {
  int ch = 0;
  do {
    print("\n1. Area of Rectangle");
    print("2. Area of Triangle");
    print("3. Area of Circle");
    print("4. Exit");
    stdout.write("Enter Your Choice : ");
    ch = int.parse(stdin.readLineSync()!);

    if(ch == 1) {
      stdout.write("Enter Width : ");
      int width = int.parse(stdin.readLineSync()!);
      stdout.write("Enter Height : ");
      int height = int.parse(stdin.readLineSync()!);
      print("Area of Rectangle : ${width * height}");
    } else if(ch == 2) {
      stdout.write("Enter Base : ");
      int base = int.parse(stdin.readLineSync()!);
      stdout.write("Enter Height : ");
      int height = int.parse(stdin.readLineSync()!);
      print("Area of Rectangle : ${(base * height) / 2}");
    } else if(ch == 3) {
      const double pi = 3.14;
      stdout.write("Enter Radius : ");
      int radius = int.parse(stdin.readLineSync()!);
      print("Area of Circle : ${pi * radius * radius}");
    } else if(ch == 4){
      print("Exit....");
    } else {
      print("Enter Valid Choice!!");
    }
  }while(ch != 4);
}