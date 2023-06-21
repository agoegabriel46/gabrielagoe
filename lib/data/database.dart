import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {

  List toDoList = [];

  final _mybox = Hive.box('mybox');

  void createInitialData(){
    toDoList = [["Make Tutorials", false], ["Do Exercise", false]];
  }

  void loadDate(){
    toDoList = _mybox.get('TODOLIST');
  }

  void upDataBase(){
    _mybox.put("TODOLIST", toDoList);
  }
}