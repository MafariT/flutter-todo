import 'package:flutter/material.dart';
import 'package:todo/util/default_button.dart';

class NewTaskDialog extends StatelessWidget {
  const NewTaskDialog({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.onCancel,
  });

  final TextEditingController controller;
  final VoidCallback onSaved;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: const Text(
        "New Task",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Enter your task...",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  )
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      actions: [
        DefaultButton(text: "Cancel", onPressed: onCancel),
        DefaultButton(text: "Save", onPressed: onSaved),
      ],
    );
  }
}
