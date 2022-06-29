class Task{
  String _name, _state;

  Task( this._name, this._state);

  String get name => _name;
  String get state => _state;

  set name(String newName){
    if(newName.length <= 255){
      this._name = newName;
    }
  }
  set state( String newState) => this._state = newState;
}