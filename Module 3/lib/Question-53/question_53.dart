// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

List<Color> color = [
  Colors.red,
  Colors.black,
  Colors.deepPurple,
  Colors.green,
  Colors.pink,
  Colors.amber
];

int index = 0;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Background Color',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: color[index],
          title: Center(
            child: Text(
              'Change Background Color',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
        ),
        body: Expanded(
          child: Container(
            color: color[index],
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (index == color.length - 1) {
                      index = 0;
                    } else {
                      index++;
                    }
                  });
                },
                child: Text("Change Background"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
