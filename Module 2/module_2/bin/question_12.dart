import 'dart:io';

void main() {
  stdout.write("Enter Number : ");
  int number = int.parse(stdin.readLineSync()!);

  int flag = 0;

  for(int i = 1;i <= number; i++) {
    if(number % i == 0) {
      flag++;
    }
  }
  if(flag == 2) {
    print("$number is Prime Number");
  } else {
    print("$number is Not Prime Number");
  }
}