import 'dart:io';

void main() {
  stdout.write("Enter Number : ");
  int n = int.parse(stdin.readLineSync()!);
  int k = 1;
  for(int i = 1;i <= n;i++) {
    for(int j = 1;j <= i;j++) {
      stdout.write("${k++} ");
    }
    print('');
  }
}