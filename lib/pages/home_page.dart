import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/model/task.dart';
import 'package:todo/util/new_task_dialog.dart';
import 'package:todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _todoBox = Hive.box<Task>('todoBox'); // typed box

  void _saveNewTask() {
    if (_controller.text.trim().isEmpty) return;

    _todoBox.add(Task(title: _controller.text.trim()));
    _controller.clear();
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Task added")),
    );
  }

  void _createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return NewTaskDialog(
          controller: _controller,
          onSaved: _saveNewTask,
          onCancel: () => Navigator.pop(context),
        );
      },
    );
  }

  void _toggleTask(Task task, bool value) {
    task.isDone = value;
    task.save();
  }

  void _deleteTask(Task task) {
    task.delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Task deleted")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: _todoBox.listenable(),
        builder: (context, Box<Task> box, _) {
          if (box.isEmpty) {
            return const Center(child: Text("No tasks yet!"));
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final task = box.getAt(index)!;
              return TodoTile(
                taskName: task.title,
                taskCompleted: task.isDone,
                onChanged: (value) => _toggleTask(task, value ?? false),
                deleteTask: (context) => _deleteTask(task),
              );
            },
          );
        },
      ),
    );
  }
}
