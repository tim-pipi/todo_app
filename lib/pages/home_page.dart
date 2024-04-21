import 'package:flutter/material.dart';
import 'package:todo_app/widgets/dialog_box.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List todoList = [
    {'taskName': 'Task 1', 'isDone': true},
    {'taskName': 'Task 2', 'isDone': false},
  ];

  final _controller = TextEditingController();

  void setTaskAsDone(bool? value, int index) {
    setState(() {
      todoList[index]['isDone'] = value!;
    });
  }

  void addNewTask() {
    setState(() {
      todoList.add(
        {
          'taskName': _controller.text,
          'isDone': false,
        }
      );
      _controller.clear();
    });
    Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Center(child: Text('To Do')),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index]['taskName'],
            isDone: todoList[index]['isDone'],
            onChanged: (value) => setTaskAsDone(value, index),
          );
        },
      ),
    );
  }
}