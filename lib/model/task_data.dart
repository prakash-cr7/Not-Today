import 'package:flutter/foundation.dart';
import 'task.dart';
import 'package:intl/intl.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks = [];
  var dateFormat = DateFormat.MMMd('en_us').add_jm();
  void addTask (String newTask, String dateTime) {
    final task = Task(name: newTask, dateTime: dateTime);
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

   String addDatetime() {
    return dateFormat.format(DateTime.now());
   }
}