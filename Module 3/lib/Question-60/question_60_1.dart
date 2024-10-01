// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.amber,
          shape: CircleBorder(),
          tooltip: "Cart",
          child: Icon(Icons.shopping_bag_outlined),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_back),
                      ),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.search),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Restaurant",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "20-30 min",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '2.4km',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Restaurant',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                            'assets/images/restaurant_logo.png',
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Orange Sandwiches is delicious'),
                        Row(
                          children: [
                            Icon(
                              Icons.star_border_sharp,
                              color: Colors.amber.shade700,
                            ),
                            Text(
                              "4.7",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        customContainer(
                          text: "Recommended",
                          bgColor: Colors.amber,
                          txtColor: Colors.white,
                        ),
                        customContainer(text: "Popular"),
                        customContainer(text: "Noodles"),
                        customContainer(text: "Pizza"),
                        customContainer(text: "Pasta"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  foodItems(
                    imagePath: 'assets/images/soba_soup.png',
                    dishName: 'Soba Soup',
                    description: 'No1. on Sales',
                    descriptionColor: Colors.amber,
                    price: 12,
                  ),
                  SizedBox(height: 20),
                  foodItems(
                    imagePath: 'assets/images/samun_phrai.png',
                    dishName: "Sei Ua Samun Phrai",
                    description: "No1. in Sale",
                    price: 12,
                  ),
                  SizedBox(height: 20),
                  foodItems(
                    imagePath: 'assets/images/ratatoullie_pasta.png',
                    dishName: "Ratatoullie Pasta",
                    description: "No1. in Sale",
                    price: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customContainer(
      {Color bgColor = Colors.white,
      Color txtColor = Colors.black,
      required String text}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            style: TextStyle(
              color: txtColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget foodItems({
    required String imagePath,
    required String dishName,
    required String description,
    required int price,
    Color descriptionColor = Colors.black,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(imagePath),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dishName,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                        color: descriptionColor,
                      ),
                    ),
                    Text(
                      '\$ $price',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.keyboard_arrow_right, size: 40)
          ],
        ),
      ),
    );
  }
}
