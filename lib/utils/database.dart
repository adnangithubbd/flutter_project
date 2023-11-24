import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List todoList = [];
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    todoList = [
      ['slide left to delete.. !', false],
      ['click + icon to add new task.. !', false],
    ];
  }

   void loadData() {
    todoList =   _myBox.get("TODOLIST");
  }
  void updateDatabase(){
    _myBox.put('TODOLIST', todoList);
  }
}
