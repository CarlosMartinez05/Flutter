enum Energy {low, medium, high}

class TaskModel{
  final String _title;
  final DateTime _date;
  final Energy _energy;

  TaskModel(this._title, this._date, this._energy);

  String get title => _title;
  DateTime get date => _date;
  Energy get energy => _energy;
}