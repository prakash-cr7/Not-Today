class Task {
  final String name;
  bool isDone;
  final String dateTime;

  Task({this.name, this.isDone = false, this.dateTime});

  Task.fromMap(Map map):
      this.dateTime = map['datetime'],
      this.isDone = map['isdone'],
      this.name = map['name'];

  Map toMap () {
    return {
    'datetime' : this.dateTime,
    'isdone' : this.isDone,
    'name' : this.name
  };
  }

}
