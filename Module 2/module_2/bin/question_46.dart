void main() {
  List<String> fruits = <String>["Apple","Banana","Grapes"];

  //print list using for loop
  for(int i = 0;i < fruits.length; i++) {
    print("Index $i : ${fruits[i]}");
  }

  //print list using for-in loop
  for(String fruit in fruits) {
    print(fruit);
  }

  //get index of element
  print("Index Of Apple : ${fruits.indexOf('Apple')}");

  //add element
  fruits.add("Watermelon");
  print(fruits);

  //add element on specify index
  fruits.insert(1, "Mango");
  print(fruits);

  //remove element
  fruits.remove("Banana");
  print(fruits);

  //remove on specify index
  fruits.removeAt(2);
  print(fruits);

}