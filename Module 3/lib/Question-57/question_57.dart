// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

String val = "red";
Color color = Colors.red;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Color Using Radio Button',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Change Color Using Radio Button')),
          ),
          body: Container(
            color: color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio(
                      value: "red",
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value!;
                          color = Colors.red;
                        });
                      },
                    ),
                    Text(
                      "Red",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "blue",
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value!;
                          color = Colors.blue;
                        });
                      },
                    ),
                    Text(
                      "Blue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "black",
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value!;
                          color = Colors.black;
                        });
                      },
                    ),
                    Text(
                      "Black",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: "orange",
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value!;
                          color = Colors.orange;
                        });
                      },
                    ),
                    Text(
                      "Orange",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
