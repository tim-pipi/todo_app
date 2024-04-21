import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  // Reference the Hive Box
  final _myBox = Hive.box('todoList');

  void createInitialData() {
    todoList = [
      {
        'taskName': 'Buy groceries',
        'isDone': false,
      },
      {
        'taskName': 'Clean the house',
        'isDone': false,
      },
      {
        'taskName': 'Cook dinner',
        'isDone': false,
      },
    ];
  }

  void loadData() {
    todoList = _myBox.get('TODO');
  }

  void saveData() {
    _myBox.put('TODO', todoList);
  }
}