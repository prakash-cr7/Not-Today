import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final String dateTime;
  final Function checkBoxCallback;
  final Function longPresscallback;
  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkBoxCallback,
      this.longPresscallback,
      this.dateTime});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        hoverColor: Colors.black45,
        focusColor: Colors.black45,
        subtitle: Text(dateTime),
        title: Text(
          taskTitle,
          style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            activeColor: Color(0xeeffffff),
            checkColor: Colors.black45,
            value: isChecked,
            onChanged: checkBoxCallback),
        onLongPress: longPresscallback);
  }
}

//(newValue) {
//setState(() {
//currentState = newValue;
//});
//},
