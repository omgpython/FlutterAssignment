// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Around Images'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/restaurant_logo.png',
              height: 100,
              width: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/restaurant_logo.png',
                  height: 100,
                  width: 100,
                ),
                Text(
                  'Hello World',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Image.asset(
                  'assets/images/restaurant_logo.png',
                  height: 100,
                  width: 100,
                ),
              ],
            ),
            Image.asset(
              'assets/images/restaurant_logo.png',
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
