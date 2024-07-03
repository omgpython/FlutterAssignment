import 'dart:io';

void main() {
  stdout.write("Enter No. 1 : ");
  int no1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter No. 2 : ");
  int no2 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter No. 3 : ");
  int no3 = int.parse(stdin.readLineSync()!);

  if(no1 > no2) {
    if(no1 > no3) {
      print("$no1 is greater then $no2 and $no3");
    }
  } else if(no2 > no3) {
    print("$no2 is greater then $no1 and $no2");
  } else {
    print("$no3 is greater then $no1 and $no2");
  }
}