// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo/components/my.register.dart';
import 'package:todo/pages/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(
      {super.key, required void Function() onTap, required String title});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future login() async {
    var url = "http://192.168.254.102/todolist/login.php";
    var response = await http.post(Uri.parse(url),
        body: {"username": user.text, "password": password.text});
    var data = await json.decode(json.encode(response.body));
    if (data == "Success") {
      Fluttertoast.showToast(msg: 'Login Successful');
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const HomePage(title: ''))));
    } else {
      Fluttertoast.showToast(msg: 'Incorrect Username and Password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          elevation: 0,
          title: const Text(
            "Login",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                  controller: user,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  )),
              const SizedBox(height: 16.0),
              TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  )),
              const SizedBox(height: 16.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    login();
                  },
                  child: const Text('Login')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen(
                                title: "",
                                onTap: () {},
                              )),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ))
            ])));
  }
}
