import 'dart:io';

Set<String> fruits = {};

String fruitInputNotContains() {
  stdout.write("Enter Fruit Name : ");
  String frtName = (stdin.readLineSync()!).toUpperCase();
  if(!fruits.contains(frtName)) {
    return frtName;
  } else {
    return "0";
  }
}

String fruitInputContains() {
  stdout.write("Enter Fruit Name : ");
  String frtName = (stdin.readLineSync()!).toUpperCase();
  if(fruits.contains(frtName)) {
    return frtName;
  } else {
    return "0";
  }
}

void addFruit() {
  String fruit = fruitInputNotContains();
  if(fruit != "0") {
    fruits.add(fruit);
    showFruits();
  } else {
    print("Fruit Already In Set");
  }
}

void removeFruit() {
  String fruit = fruitInputContains();
  if(fruit != "0") {
    fruits.remove(fruit);
    showFruits();
  } else {
    print("Fruit Not In Set");
  }
}

void updateFruit() {
  String fruit = fruitInputContains();
  if(fruit != "0") {
    String newFruit = fruitInputNotContains();
    if(newFruit != "0") {
      fruits.remove(fruit);
      fruits.add(newFruit);
      showFruits();
    } else {
      print("Fruit Already In Set");
    }
  } else {
    print("Fruit Not In Set");
  }
}

void showFruits() {
  var i = 1;
  if(fruits.isNotEmpty) {
    for (String fruit in fruits) {
      print("${i++} : $fruit");
    }
  } else {
    print("No Fruits In Set");
  }
}

void main() {
  int ch;
  do {
    print("\n1. Add Fruit");
    print("2. Remove Fruit");
    print("3. Update Fruit");
    print("4. Show All Fruits");
    print("5. Exit");
    stdout.write("Enter Your Choice : ");
    ch = int.parse(stdin.readLineSync()!);

    switch(ch) {
      case 1:
        addFruit();
        break;
      case 2:
        removeFruit();
        break;
      case 3:
        updateFruit();
        break;
      case 4:
        showFruits();
        break;
      case 5:
        print("Exit....");
        break;
      default:
        print("Invalid Choice!!!");
    }
  } while(ch != 5);
}