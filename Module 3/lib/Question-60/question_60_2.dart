// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String about =
      "A vibrant Thai sausage made with ground chicken, plus its spicy chile dip, from Chef Parnass Savage of Atlanta's Talat Market.";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          icon: Icon(
            Icons.shopping_bag_outlined,
            size: 30,
          ),
          backgroundColor: Colors.amber,
          label: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              '1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.favorite_border),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -90,
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: AssetImage(
                                  'assets/images/samun_phrai.png',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'Sei Ua Samun Phrai',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          descriptionWithIcon(
                            icon: Icons.access_time_outlined,
                            iconColor: Colors.blueAccent,
                            text: '50min',
                          ),
                          descriptionWithIcon(
                            icon: Icons.star,
                            iconColor: Colors.amber,
                            text: '4.8',
                          ),
                          descriptionWithIcon(
                            icon: Icons.local_fire_department,
                            iconColor: Colors.red,
                            text: '325 Kcal',
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade300,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Text(
                                '\$12',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '-',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: Text('1'),
                                    ),
                                    Text(
                                      '+',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 25),
                            child: Text(
                              'Ingredienta',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 25,
                            bottom: 25,
                            right: 25,
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 25),
                              ingredients(
                                image: 'assets/images/noodle.png',
                                text: 'Noodles',
                              ),
                              SizedBox(width: 25),
                              ingredients(
                                image: 'assets/images/shrimp.png',
                                text: 'Shrimp',
                              ),
                              SizedBox(width: 25),
                              ingredients(
                                image: 'assets/images/egg.png',
                                text: 'Egg',
                              ),
                              SizedBox(width: 25),
                              ingredients(
                                image: 'assets/images/scallion.png',
                                text: 'Scallion',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 25),
                            child: Text(
                              'About',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, top: 15, right: 25),
                        child: Text(
                          about,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget descriptionWithIcon({
    required IconData icon,
    required Color iconColor,
    required String text,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(width: 3),
        Text(
          text,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  Widget ingredients({required String image, required String text}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(80),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              height: 70,
              width: 70,
              fit: BoxFit.fill,
              image,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
