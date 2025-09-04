import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/model/task.dart';
import 'package:todo/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter()); 
  await Hive.openBox<Task>('todoBox');

  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF1F1F1F),
        ),
        dialogTheme: const DialogThemeData(backgroundColor: Color(0xFF1F1F1F)),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: const Color(0xFF1F1F1F),
          contentTextStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary)
        )
      ),

      themeMode: ThemeMode.system,
    );
  }
}
