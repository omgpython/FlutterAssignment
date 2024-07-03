import 'dart:io';

void main() {
  stdout.write("Enter No. Of Week Days : ");
  int day = int.parse(stdin.readLineSync()!);

  switch(day) {
    case 1:
      print("Sunday");
      break;
    case 2:
      print("Monday");
      break;
    case 3:
      print("Tuesday");
      break;
    case 4:
      print("Wednesday");
      break;
    case 5:
      print("Thursday");
      break;
    case 6:
      print("Friday");
      break;
    case 7:
      print("Saturday");
      break;
    default:
      print("Enter Valid Day!!");
  }
}