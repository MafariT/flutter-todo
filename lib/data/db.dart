import 'package:hive_flutter/hive_flutter.dart';

class ToDoDB {
  final _todoBox = Hive.box("todoBox");
  List toDoList = [];

  void createInitialData() {
    toDoList = [
      ["First Note!", false]
    ];
  }

  void loadData() {
    toDoList = _todoBox.get("TODOLIST");
  }

  void updateData() {
    _todoBox.put("TODOLIST", toDoList);
  }
}