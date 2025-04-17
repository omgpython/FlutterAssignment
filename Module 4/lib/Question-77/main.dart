import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone and SMS Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  Future<void> makeCall(String phoneNumber) async {
    final Uri phoneUrl = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(phoneUrl.toString())) {
      await launch(phoneUrl.toString());
    } else {
      throw 'Could not launch $phoneUrl';
    }
  }

  Future<void> sendSMS(String phoneNumber, String message) async {
    final Uri smsUrl = Uri(
        scheme: 'sms', path: phoneNumber, queryParameters: {'body': message});
    if (await canLaunch(smsUrl.toString())) {
      await launch(smsUrl.toString());
    } else {
      throw 'Could not launch $smsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone and SMS Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                makeCall('1234567890');
              },
              child: Text('Make Phone Call'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sendSMS('1234567890', 'Hello, this is a test message!');
              },
              child: Text('Send SMS'),
            ),
          ],
        ),
      ),
    );
  }
}
