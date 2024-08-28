// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

String oprator = "", result = "";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Calculator')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter No. 1',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter No. 2',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Radio(
                    value: "+",
                    groupValue: oprator,
                    onChanged: (value) {
                      setState(() {
                        oprator = value!;
                      });
                    },
                  ),
                  Text(
                    "Addition",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: "-",
                    groupValue: oprator,
                    onChanged: (value) {
                      setState(() {
                        oprator = value!;
                      });
                    },
                  ),
                  Text(
                    "Subtraction",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: "*",
                    groupValue: oprator,
                    onChanged: (value) {
                      setState(() {
                        oprator = value!;
                      });
                    },
                  ),
                  Text(
                    "Multiplication",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: "/",
                    groupValue: oprator,
                    onChanged: (value) {
                      setState(() {
                        oprator = value!;
                      });
                    },
                  ),
                  Text(
                    "Division",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Calculate"),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              Text(
                result,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
