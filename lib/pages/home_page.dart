import 'package:flutter/material.dart';
import 'package:todo/util/new_task_dialog.dart';
import 'package:todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ["Data 1", false],
    ["Data 2", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];

    });
  }
 
  void saveNewTask(){
    setState(() {
      toDoList.add([ _controller.text, false ]);
      _controller.clear();
    });
      Navigator.pop(context);
  }

  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return NewTaskDialog(
          controller: _controller,
          onSaved: saveNewTask,
          onCancel: () => Navigator.pop(context),
        );
      }
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(
          taskName: toDoList[index][0], 
          taskCompleted: toDoList[index][1], 
          onChanged: (value) => checkBoxChanged(value, index),
          deleteTask:(context) => deleteTask(index),
          );
        },
      ),
    );
  }
}