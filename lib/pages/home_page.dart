import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/db.dart';
import 'package:todo/util/new_task_dialog.dart';
import 'package:todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _todoBox = Hive.box('todoBox');
  ToDoDB db = ToDoDB();

  @override
  void initState() {
    if (_todoBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }
 
  void saveNewTask(){
    setState(() {
      db.toDoList.add([ _controller.text, false ]);
      _controller.clear();
    });
      Navigator.pop(context);
      db.updateData();
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
      db.toDoList.removeAt(index);
    });
    db.updateData();
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
        itemCount: db.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(
          taskName: db.toDoList[index][0], 
          taskCompleted: db.toDoList[index][1], 
          onChanged: (value) => checkBoxChanged(value, index),
          deleteTask:(context) => deleteTask(index),
          );
        },
      ),
    );
  }
}