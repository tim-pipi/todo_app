import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isDone;
  Function(bool?)? onChanged;

  TodoTile({
    super.key,
    required this.taskName,
    required this.isDone,
    required this.onChanged,
  });

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.blueAccent[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Checkbox
            Checkbox(
              value: isDone,
              onChanged: onChanged,
            ),

            // Task Name
            Text(taskName),
          ],
        ),
      ),
    );
  }
}