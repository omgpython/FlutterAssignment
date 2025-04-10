import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Options Menu Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void menuSelect(BuildContext context, String choice) {
    switch (choice) {
      case 'Profile':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile clicked')),
        );
        break;
      case 'Logout':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout clicked')),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options Menu Demo'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String choice) => menuSelect(context, choice),
            itemBuilder: (BuildContext context) {
              return {'Profile', 'Logout'}.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
