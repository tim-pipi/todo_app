import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/widgets/dialog_box.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Reference the Hive box
  final _myBox = Hive.box('todoList');

  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // Check if the box is empty
    if (_myBox.get('TODO') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }


  final _controller = TextEditingController();

  void setTaskAsDone(bool? value, int index) {
    setState(() {
      db.todoList[index]['isDone'] = value!;
    });
    db.saveData();
  }

  void addNewTask() {
    setState(() {
      db.todoList.add(
        {
          'taskName': _controller.text,
          'isDone': false,
        }
      );
      _controller.clear();
    });
    Navigator.pop(context);
    db.saveData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onAdd: addNewTask,
          onCancel: () => Navigator.pop(context),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Center(
          child: Text(
            'TO DO',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index]['taskName'],
            isDone: db.todoList[index]['isDone'],
            onChanged: (value) => setTaskAsDone(value, index),
            onDelete: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}