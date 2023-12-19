import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/components/my.profile.dart';
import 'package:todo/components/my.settings.dart';
import 'package:todo/components/my.todo.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/services/database.dart';
import 'package:todo/services/dialog_box.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: const Text('Manage Activities'),
          elevation: 0,
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {},
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                        },
                      ),
                    ]),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black,
                  onPressed: createNewTask,
                  child: const Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDo(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}

Future showToast(String message) async {
  await Fluttertoast.cancel();

  Fluttertoast.showToast(msg: message, fontSize: 18);
}
