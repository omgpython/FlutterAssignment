// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: FilledButton(
            onPressed: () {
              _showAlertDialog(context);
            },
            child: Text('Show Alert Dialog'),
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure want to Logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Fluttertoast.showToast(msg: 'Natural Button Pressed');
                Navigator.pop(context);
              },
              child: Text('Rate US'),
            ),
            TextButton(
              onPressed: () {
                Fluttertoast.showToast(msg: 'Negative Button Pressed');
                Navigator.pop(context);
              },
              child: Text(
                'No',
                style: TextStyle(color: Colors.green),
              ),
            ),
            TextButton(
              onPressed: () {
                Fluttertoast.showToast(msg: 'Positive Button Pressed');
                Navigator.pop(context);
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
