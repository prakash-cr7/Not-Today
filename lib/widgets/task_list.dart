import 'package:flutter/material.dart';
import 'package:tuddu/model/task_data.dart';
import 'package:tuddu/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle:
              Provider.of<TaskData>(context, listen: true).tasks[index].name,
          isChecked:
              Provider.of<TaskData>(context, listen: true).tasks[index].isDone,
          checkBoxCallback: (changedValue) {
            Provider.of<TaskData>(context, listen: false).toggleIsDone(index);
          },
          longPresscallback: () {
            Provider.of<TaskData>(context, listen: false).deleteTask(index);
          },
        );
      },
      itemCount: Provider.of<TaskData>(context, listen: true).tasks.length,
    );
  }
}
