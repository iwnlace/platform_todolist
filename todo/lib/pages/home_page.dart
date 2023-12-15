import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tasks",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Organize and manage your activities below.",
                    style: TextStyle(fontSize: 16),
                  ),
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
