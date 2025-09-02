import 'package:flutter/material.dart';
import 'package:todo/util/default_button.dart';

class NewTaskDialog extends StatelessWidget {
  NewTaskDialog({super.key, required this.controller, required this.onSaved, required this.onCancel});
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 128,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Add new task"
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultButton(text: "Cancel", onPressed: onCancel),
                DefaultButton(text: "Save", onPressed: onSaved)
              ],
            )
          ],
        ),
      ),
    );
  }
}