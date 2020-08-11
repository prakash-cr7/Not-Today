import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks = [];

  void addTask (String newTask) {
    final task = Task(name: newTask);
    tasks.add(task);
    notifyListeners();
  }
   void toggleIsDone (int index) {
     tasks[index].isDone = !tasks[index].isDone;
     notifyListeners();
   }

   void deleteTask (int index) {
    tasks.remove(tasks[index]);
    notifyListeners();
   }
}