// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double redColor = 0, greenColor = 0, blueColor = 0;
  Color? bgColor;

  void updateColor({required int red, required int green, required int blue}) {
    bgColor = Color.fromRGBO(
      red,
      green,
      blue,
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text('Change Background Using Seekbar'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: redColor,
                  max: 255,
                  onChanged: (value) {
                    setState(() {
                      redColor = value;
                      updateColor(
                        red: redColor.toInt(),
                        green: greenColor.toInt(),
                        blue: blueColor.toInt(),
                      );
                    });
                  },
                ),
                Text(
                  redColor.toInt().toString(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: greenColor,
                  max: 255,
                  onChanged: (value) {
                    setState(() {
                      greenColor = value;
                      updateColor(
                        red: redColor.toInt(),
                        green: greenColor.toInt(),
                        blue: blueColor.toInt(),
                      );
                    });
                  },
                ),
                Text(
                  greenColor.toInt().toString(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: blueColor,
                  max: 255,
                  onChanged: (value) {
                    setState(() {
                      blueColor = value;
                      updateColor(
                        red: redColor.toInt(),
                        green: greenColor.toInt(),
                        blue: blueColor.toInt(),
                      );
                    });
                  },
                ),
                Text(
                  blueColor.toInt().toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
