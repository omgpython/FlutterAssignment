//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String description =
        "Lake Oeschinen lines at the foot of the Bluemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondala ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here including rowing, and riding the summer toboggan run.";
    return MaterialApp(
      title: 'UI Design',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Flutter Layout Demo")),
        ),
        body: Column(
          children: [
            Image.asset(
              'assets/images/nature.jpg',
              height: 250,
              width: 500,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Oeschinen Lake Campground",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Kandersteg, Switzerland",
                      style: TextStyle(fontSize: 19, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.red.shade300,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "41",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.indigoAccent,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "CALL",
                      style:
                          TextStyle(color: Colors.indigoAccent, fontSize: 18),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.navigation,
                      color: Colors.indigoAccent,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "ROUTE",
                      style:
                          TextStyle(color: Colors.indigoAccent, fontSize: 18),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.indigoAccent,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "SHARE",
                      style:
                          TextStyle(color: Colors.indigoAccent, fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
