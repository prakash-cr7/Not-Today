import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({this.taskScreenCallback});
  final Function taskScreenCallback;

  String newTaskTitle;
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: Colors.white),
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
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                ),
              ),
              TextField(
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
                color: Colors.lightBlueAccent,
                child: Text(
                  'Add',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  taskScreenCallback(newTaskTitle);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
