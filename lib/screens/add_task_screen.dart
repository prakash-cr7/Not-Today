import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuddu/model/task_data.dart';

class AddTaskScreen extends StatelessWidget {

  String newTaskTitle ;
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: Colors.transparent
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                'Add task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 30,
                ),
              ),
              TextField(
                cursorColor: Colors.black45,
                textAlign: TextAlign.center,
                autofocus: true,
                onChanged: (value) {
                  newTaskTitle = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(vertical: 13),
                color: Colors.black45,
                child: Text(
                  'Add',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {
                  if(newTaskTitle != null)
                  Provider.of<TaskData>(context, listen: false).addTask(
                        newTaskTitle);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
