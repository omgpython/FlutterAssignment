// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Question 49-1',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 230,
              width: 500,
              color: Colors.red,
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 200,
                  width: 220,
                  color: Colors.blue,
                ),
                Container(
                  height: 200,
                  width: 220,
                  color: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 200,
                  width: 220,
                  color: Colors.blue,
                ),
                Container(
                  height: 200,
                  width: 220,
                  color: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 140,
                  width: 145,
                  color: Colors.yellow,
                ),
                Container(
                  height: 140,
                  width: 145,
                  color: Colors.yellow,
                ),
                Container(
                  height: 140,
                  width: 145,
                  color: Colors.yellow,
                ),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 140,
                  width: 145,
                  color: Colors.yellow,
                ),
                Container(
                  height: 140,
                  width: 145,
                  color: Colors.yellow,
                ),
                Container(
                  height: 140,
                  width: 145,
                  color: Colors.yellow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
