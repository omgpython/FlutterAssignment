// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
              ),
            ),
            SizedBox(height: 6),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 204,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Container(
                          height: 204,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 204,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Container(
                          height: 204,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 150,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Container(
                          height: 150,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Container(
                          height: 150,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 150,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Container(
                          height: 150,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Container(
                          height: 150,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
