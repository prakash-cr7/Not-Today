import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuddu/model/task_data.dart';
import 'package:tuddu/widgets/task_list.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int currentBackground = 4;

  void changeBackground() {
    if (currentBackground != 4)
      ++currentBackground;
    else
      currentBackground = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AddTaskScreen()),
                  ));
        },
        backgroundColor: Color(0x88333333),
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/game_of_thrones ($currentBackground).jpg'),
                fit: BoxFit.fill)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        changeBackground();
                        setState(() {});
                      },
                      child: CircleAvatar(
                        child: Icon(
                          Icons.list,
                          size: 30,
                          color: Color(0xddffffff),
                        ),
                        foregroundColor: Colors.lightBlueAccent,
                        backgroundColor: Color(0x55ffffff),
                        radius: 30,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Not Today',
                      style: TextStyle(
                          color: Color(0xddffffff),
                          fontSize: 50,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '${Provider.of<TaskData>(context, listen: true).tasks.length} Tasks',
                      style: TextStyle(
                        color: Color(0xddffffff),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0x55ffffff),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: TaskList(),
                ),
              )
            ]),
      ),
    );
  }
}
