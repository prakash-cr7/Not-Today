import 'package:flutter/material.dart';
import 'package:tuddu/widgets/task_tile.dart';
import 'package:tuddu/model/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList({this.tasks});
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkBoxCallback: (changedValue) {
            setState(() {
              widget.tasks[index].toggleIsDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
