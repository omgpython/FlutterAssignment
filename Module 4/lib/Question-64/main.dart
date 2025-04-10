// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> cityList = ['Surat', 'Ahmedabad', 'Gandhi Nagar', 'Raj Pipla'];
  String city = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            city.trim().isEmpty ? "City Not Selected" : "Selected City : $city",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              child: Text('Select City'),
            ),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select City'),
          content: DropdownButton(
            value: city,
            items: List.generate(
              cityList.length,
              (index) => DropdownMenuItem(
                value: cityList[index],
                child: Text(cityList[index]),
              ),
            ),
            onChanged: (value) {
              setState(() {
                city = value!;
                Navigator.pop(context);
              });
            },
          ),
        );
      },
    );
  }
}
