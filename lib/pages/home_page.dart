import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Center(child: Text('To Do')),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          TodoTile(),
        ],
      ),
    );
  }
}