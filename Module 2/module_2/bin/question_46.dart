import 'dart:io';

List<String> colors = [];

String colourInputNotContains() {
  stdout.write("Enter Color Name : ");
  String clrName = (stdin.readLineSync()!).toUpperCase();
  if(!colors.contains(clrName)) {
    return clrName;
  } else {
    return "0";
  }
}

String colourInputContains() {
  stdout.write("Enter Color Name : ");
  String clrName = (stdin.readLineSync()!).toUpperCase();
  if(colors.contains(clrName)) {
    return clrName;
  } else {
    return "0";
  }
}

void addColor() {
  String clr = colourInputNotContains();
  if(clr != "0") {
    colors.add(clr);
    showColors();
  } else {
    print("Color Already In List");
  }
}

void removeColor() {
  String clr = colourInputContains();
  if(clr != "0") {
    colors.remove(clr);
    showColors();
  } else {
    print("Color Not In List");
  }
}

void updateColor() {
  String clr = colourInputContains();
  if(clr != "0") {
    String newClr = colourInputNotContains();
    if(newClr != "0") {
      colors[colors.indexOf(clr)] = newClr;
      showColors();
    } else {
      print("Color Already In List");
    }
  } else {
    print("Color Not In List");
  }
}

void showColors() {
  var i = 1;
  if(colors.isNotEmpty) {
    for (String color in colors) {
      print("${i++} : $color");
    }
  } else {
    print("No Colors In List");
  }
}

void main() {
  int ch;
  do {
    print("\n1. Add Color");
    print("2. Remove Color");
    print("3. Update Color");
    print("4. Show All Colors");
    print("5. Exit");
    stdout.write("Enter Your Choice : ");
    ch = int.parse(stdin.readLineSync()!);

    switch(ch) {
      case 1:
        addColor();
        break;
      case 2:
        removeColor();
        break;
      case 3:
        updateColor();
        break;
      case 4:
        showColors();
        break;
      case 5:
        print("Exit....");
        break;
      default:
        print("Invalid Choice!!!");
    }

  } while(ch != 5);
}