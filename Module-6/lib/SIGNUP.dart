import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SIGNIN_screen.dart';

class MySignupScreen extends StatefulWidget {
  const MySignupScreen({super.key});

  @override
  State<MySignupScreen> createState() => _MySignupScreenState();
}

class _MySignupScreenState extends State<MySignupScreen> {
  TextEditingController _nameField = TextEditingController();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  String profilePic =
      "https://cdn3d.iconscout.com/3d/premium/thumb/profile-8260859-6581822.png?f=webp";

  Future<void> registerUser(
    String? username,
    String? email,
    String? password,
  ) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);

    User? user = userCredential.user;

    await FirebaseFirestore.instance.collection("Person").doc(user!.uid).set({
      "username": username,
      "email": email,
      "profilePic": profilePic,
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MySignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _nameField,
            decoration: InputDecoration(
              hintText: "Enter your name : ",
              labelText: "Name",
            ),
          ),
          TextField(
            controller: _emailField,
            decoration: InputDecoration(
              hintText: "Enter Email",
              labelText: "Email",
            ),
          ),
          TextField(
            controller: _passwordField,
            decoration: InputDecoration(
              hintText: "Enter password : ",
              labelText: "Password",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              registerUser(
                _nameField.text.toString(),
                _emailField.text.toString(),
                _passwordField.text.toString(),
              );
            },
            child: Text("Save"),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MySignInScreen()),
              );
            },
            child: Text("Click here for login"),
          ),
        ],
      ),
    );
  }
}
