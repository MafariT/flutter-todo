import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  TodoTile({super.key, required this.taskName, required this.taskCompleted, required this.onChanged, required this.deleteTask});
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade400,
              borderRadius: BorderRadius.circular(8),
            )
          ]
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.blue[800]),
              Text(
                taskName,
                style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough :  TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}