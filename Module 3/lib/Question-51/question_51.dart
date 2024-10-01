// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _key = GlobalKey<FormState>();

  String? _no1, _no2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input No.'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter No. 1',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Can\'t Empty';
                  }
                  return null;
                },
                onSaved: (no1) {
                  _no1 = no1;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter No. 2',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Can\'t Empty';
                  }
                  return null;
                },
                onSaved: (no2) {
                  _no2 = no2;
                },
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            no1: _no1!,
                            no2: _no2!,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  String no1, no2;
  List<String> numbers = [];
  SecondScreen({required this.no1, required this.no2});

  @override
  Widget build(BuildContext context) {
    addNumbers();
    return Scaffold(
      appBar: AppBar(
        title: Text('Print Numbers'),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              numbers[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          );
        },
      ),
    );
  }

  void addNumbers() {
    int n1 = int.parse(no1);
    int n2 = int.parse(no2);
    numbers.clear();
    if (n1 < n2) {
      for (int i = n1; i <= n2; i++) {
        numbers.add(i.toString());
      }
    } else if (n1 > n2) {
      for (int i = n1; i >= n2; i--) {
        numbers.add(i.toString());
      }
    } else {
      numbers.add(n1.toString());
    }
  }
}
