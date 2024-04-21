import 'package:flutter/material.dart';
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

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index]['isDone'] = value!;
    });
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
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index]['taskName'],
            isDone: todoList[index]['isDone'],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}