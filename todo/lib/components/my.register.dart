import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo/pages/home_page.dart';
import 'package:todo/pages/my.login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen(
      {super.key, required void Function() onTap, required String title});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();
  Future register() async {
    var url = "http://192.168.254.102/todolist/register.php";
    var response = await http.post(Uri.parse(url),
        body: {"username": user.text, "password": password.text});
    var data = await json.decode(json.encode(response.body));
    if (data == "Error") {
      Fluttertoast.showToast(msg: 'User already exist!');
    } else {
      Fluttertoast.showToast(msg: 'Register Succesful');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => const HomePage(title: 'title'))));
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
            "Register",
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
                  backgroundColor: Colors.black, // background (button) color
                  foregroundColor: Colors.white,
                ), // foreground (text) color
                onPressed: register,
                child: const Text('Register'),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen(
                                title: "Activities",
                                onTap: () {},
                              )),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ))
            ])));
  }
}
