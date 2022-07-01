enum Energy {low, medium, high}

class TaskModel{
  String _titulo;
  DateTime _fecha;
  Energy _energy;

  TaskModel(this._titulo, this._fecha, this._energy);

  String get titulo => this._titulo;
  DateTime get fecha => this._fecha;
  Energy get energy => this._energy;
}