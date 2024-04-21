import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;

  TodoTile({
    super.key,
    required this.taskName,
    required this.isDone,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 12.0,
        right: 12.0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
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
                activeColor: Colors.black,
              ),
        
              // Task Name
              Text(
                taskName,
                style: TextStyle(
                  decoration: isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}