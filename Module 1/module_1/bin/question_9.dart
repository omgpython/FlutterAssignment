void main() {
  int no1 = 20;
  int no2 = 10;

  print("Before Swap : no1 = $no1 and no2 = $no2");

  no1 = no1 + no2;
  no2 = no1 - no2;
  no1 = no1 - no2;

  print("After Swap : no1 = $no1 and no2 = $no2");
}