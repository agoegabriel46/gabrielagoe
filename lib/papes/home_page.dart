import 'package:billy_todo/data/database.dart';
import 'package:billy_todo/utilities/dialog_box.dart';
import 'package:billy_todo/utilities/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// bool _iconBool = false;
// IconData _iconLight = Icons.wb_sunny;
// IconData _iconDark = Icons.nights_stay;


// ThemeData _lightTheme = ThemeData(
//   primarySwatch: Colors.amber,
//   brightness: Brightness.light
// );


// ThemeData _darkTheme = ThemeData(
//   primarySwatch: Colors.red,
//   brightness: Brightness.dark
// );

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  


  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadDate();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });

    db.upDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.upDataBase();
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
    db.upDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: const Text(
            'TO DO',
            style: TextStyle(fontFamily: 'IndieFlower'),
          ),
        ),
        
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
