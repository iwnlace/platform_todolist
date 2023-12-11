// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:todo/components/my.button.dart';
import 'package:todo/components/my.register.dart';
import 'package:todo/components/my.textfield.dart';
import 'package:todo/components/square.tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required String title});

  //controllers

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 50),

            //logo
            const Icon(
              Icons.lock,
              size: 100,
            ),

            const SizedBox(height: 50),

            //welcome back, we missed you!
            const Text(
              'Welcome back you\'ve been missed',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 25),

            //username textfield
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),

            //password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(height: 25),

            //sign in button
            MyButton(
              onTap: signUserin,
            ),

            //register now
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not a Member?'),
                const SizedBox(
                  width: 4,
                ),
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
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }

  Color get newMethod => Colors.grey.shade400;
}
