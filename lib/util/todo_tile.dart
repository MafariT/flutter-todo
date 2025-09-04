import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.taskName, required this.taskCompleted, required this.onChanged, required this.deleteTask});
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade600,
              borderRadius: BorderRadius.circular(8),
            )
          ]
        ),
        child: Material(
          color: const Color(0xFF1F1F1F),
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {
              onChanged!(!taskCompleted);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Theme.of(context).colorScheme.primary,),
                  Expanded(
                    child: Text(
                      taskName,
                      style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough :  TextDecoration.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}