import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class MySignInScreen extends StatefulWidget {
  const MySignInScreen({super.key});

  @override
  State<MySignInScreen> createState() => _MySignInScreenState();
}

class _MySignInScreenState extends State<MySignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> login(String? email, String? password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);

    User? user = userCredential.user;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomeScreen(user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "Enter email",
              labelText: "Email",
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: "Enter Password",
              labelText: "Password",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              login(
                _emailController.text.toString(),
                _passwordController.text.toString(),
              );
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
