import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuddu/model/task_data.dart';
import 'screens/task_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
