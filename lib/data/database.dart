import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  // Reference the Hive Box
  final _myBox = Hive.box('todoList');

  void createInitialData() {
    todoList = [
      {
        'taskName': 'Tap on the checkbox next to a task to mark it as done',
        'isDone': false,
      },
      {
        'taskName': 'Swipe left and click on the bin icon to delete a task',
        'isDone': false,
      },
      {
        'taskName': 'Tap on the "+" button to add a new task',
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