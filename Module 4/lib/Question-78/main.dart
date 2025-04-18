import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name List Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> names = [];
  final TextEditingController controller = TextEditingController();

  void showNameDialog(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Name'),
          content: Text(name),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showContextMenu(
      BuildContext context, String name, int index) async {
    final result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100.0, 100.0, 100.0, 100.0),
      items: [
        PopupMenuItem<String>(
          value: 'edit',
          child: Text('Edit Item'),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: Text('Delete Item'),
        ),
        PopupMenuItem<String>(
          value: 'exit',
          child: Text('Exit'),
        ),
      ],
      elevation: 8.0,
    );

    if (result == 'edit') {
      editName(name, index);
    } else if (result == 'delete') {
      confirmDelete(name, index);
    }
  }

  void confirmDelete(String name, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure you want to delete?'),
          actions: [
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                setState(() {
                  names.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void editName(String name, int index) {
    controller.text = name;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter name'),
          ),
          actions: [
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  names[index] = controller.text;
                  controller.clear();
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                controller.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void addName() {
    if (controller.text.isNotEmpty) {
      setState(() {
        names.add(controller.text);
      });
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name List Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: addName,
              child: Text('Add Name'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(names[index]),
                    onTap: () => showNameDialog(names[index]),
                    onLongPress: () =>
                        _showContextMenu(context, names[index], index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
