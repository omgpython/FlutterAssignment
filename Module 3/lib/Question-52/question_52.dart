// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

String oprator = "+", result = "";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final number1Controller = TextEditingController();
  final number2Controller = TextEditingController();

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
                controller: number1Controller,
                decoration: InputDecoration(
                  labelText: 'Enter No. 1',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: number2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter No. 2',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
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
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    setState(() {
                      int num1 = int.parse(number1Controller.text.trim());
                      int num2 = int.parse(number2Controller.text.trim());

                      if (oprator == "+") {
                        result =
                            "The Addition of $num1 and $num2 is ${num1 + num2}";
                      } else if (oprator == "-") {
                        result =
                            "The Subtraction of $num1 and $num2 is ${num1 - num2}";
                      } else if (oprator == "*") {
                        result =
                            "The Multiplication of $num1 and $num2 is ${num1 * num2}";
                      } else if (oprator == "/") {
                        result =
                            "The Division of $num1 and $num2 is ${num1 / num2}";
                      }
                    });
                  },
                  child: Text("Calculate"),
                ),
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
