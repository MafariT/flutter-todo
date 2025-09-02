import 'package:flutter/material.dart';
import 'package:todo/pages/home_page.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[200],
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue[400]),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.blue[400]),
        dialogTheme: DialogThemeData(backgroundColor: Colors.blue[200]),
        inputDecorationTheme: InputDecorationThemeData(
          border: OutlineInputBorder(),
        ),
        buttonTheme: ButtonThemeData()
      ),
    );
  }
}