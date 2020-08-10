import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallback;
  TaskTile({this.isChecked, this.taskTitle, this.checkBoxCallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: checkBoxCallback));
  }
}

//(newValue) {
//setState(() {
//currentState = newValue;
//});
//},
