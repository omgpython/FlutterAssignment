import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Call App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    PermissionStatus status = await Permission.phone.status;

    if (status.isDenied || status.isRestricted) {
      permissionDialog();
    } else if (status.isPermanentlyDenied) {
      permissionDialog();
    }
  }

  void permissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Permission Required"),
          content: Text(
              "This app requires phone call permissions to function. Would you like to allow it?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Deny"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                openAppSettings();
              },
              child: Text("Allow"),
            ),
          ],
        );
      },
    );
  }

  void makeCall() async {
    PermissionStatus status = await Permission.phone.status;
    if (status.isGranted) {
      print("Making phone call...");
    } else {
      print("Permission is not granted.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Call App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: makeCall,
          child: Text('Make Phone Call'),
        ),
      ),
    );
  }
}
