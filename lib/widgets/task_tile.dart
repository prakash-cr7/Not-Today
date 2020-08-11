import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallback;
  final Function longPresscallback;
  TaskTile({this.isChecked, this.taskTitle, this.checkBoxCallback, this.longPresscallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            color: Color(0xeeffffff),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            activeColor: Color(0xeeffffff),
            checkColor: Colors.black45,
            focusColor: Colors.green,
            hoverColor: Colors.red,
            value: isChecked,
            onChanged: checkBoxCallback
        ),
      onLongPress: longPresscallback
    );
  }
}

//(newValue) {
//setState(() {
//currentState = newValue;
//});
//},
