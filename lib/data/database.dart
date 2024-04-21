import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  // Reference the Hive Box
  final _myBox = Hive.openBox('todoList');
}