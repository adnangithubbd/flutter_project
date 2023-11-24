import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_flutter/utils/database.dart';

import '../utils/dialog_box.dart';
import '../utils/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isCompleted = false;
  final _controler = TextEditingController();
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    if(_myBox.get('TODOLIST')==null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  void changed(bool value) {
    isCompleted = !isCompleted;
    db.updateDatabase();
  }

  createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controler,
            onCancel: () {
              Navigator.of(context).pop();
            },
            onSave: () {
              if (_controler.text.isEmpty) {
                Navigator.of(context).pop();
              } else {
                setState(() {
                  db.todoList.add([_controler.text, false]);
                  db.updateDatabase();
                  _controler.clear();
                });
              }
              _controler.clear();

              Navigator.of(context).pop();
            },
          );
        });
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
      db.updateDatabase();
    });
  }

  deleteTile(int index) {
    setState(() {
      db.todoList.removeAt(index);
      db.updateDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text(
          'TO DO',
          style: TextStyle(),
        ),
        backgroundColor: Colors.yellow,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              deleletFunction: (context) => deleteTile(index),
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => checkboxChanged(value, index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
