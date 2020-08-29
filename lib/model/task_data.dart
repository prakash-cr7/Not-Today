import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'task.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class TaskData extends ChangeNotifier{

  List<Task> tasks = [];
  var dateFormat = DateFormat.d('en_us').add_MMM().add_jm();
  SharedPreferences sharedPreferences;

  void initSP () async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
    notifyListeners();
  }

  void addTask (String newTask, String dateTime) {
    final task = Task(name: newTask, dateTime: dateTime);
    tasks.add(task);
    saveData();
    notifyListeners();
  }

   void toggleIsDone (int index) {
     tasks[index].isDone = !tasks[index].isDone;
     saveData();
     notifyListeners();
   }

   void deleteTask (int index) {
    tasks.remove(tasks[index]);
    saveData();
    notifyListeners();
   }

   String addDatetime() {
    return dateFormat.format(DateTime.now());
   }

  void loadData() {
    List<String> listString = sharedPreferences.getStringList('list');
    if(listString != null){
      tasks = listString.map(
              (item) => Task.fromMap(json.decode(item))
      ).toList();
    }
  }

  void saveData(){
    List<String> stringList = tasks.map(
            (item) => json.encode(item.toMap()
        )).toList();
    sharedPreferences.setStringList('list', stringList);
  }
}


