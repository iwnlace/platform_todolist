import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/components/my.profile.dart';
import 'package:todo/components/my.settings.dart';
import 'package:todo/components/my.todo.dart';
import 'package:todo/pages/my.login.dart';
import 'package:todo/pages/todo.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Home",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Organize and manage your activities below.",
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 610.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[100]),
                      onPressed: () {
                        _auth.signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Signout",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.black,
            children: [
              SpeedDialChild(
                child: const Icon(Icons.add),
                label: 'Add Task',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ToDoPage()));
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.home),
                label: 'Home',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.settings),
                label: 'Settings',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.person),
                label: 'Profile',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
            ]),
      ),
    );
  }

  Future showToast(String message) async {
    await Fluttertoast.cancel();

    Fluttertoast.showToast(msg: message, fontSize: 18);
  }
}
