import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key}) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _inputTitle = TextEditingController();
  TextEditingController _inputDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(children: [
        _fieldTitle(),
        _fieldDate(context),
        _fieldEnergy(),
        _buttonSave(),
      ],),

    );
  }

  Widget _fieldTitle(){
    return TextFormField(
      controller: _inputTitle,
      validator: (value) {
        if (value == null || value.isEmpty){
          return 'You Need Add a title';
        }
        return null;
      },
    );
  }

  Widget _fieldDate(BuildContext context
      ){
    return TextFormField(
      enabled: false,
      controller: _inputDate,
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  Widget _fieldEnergy(){
    return TextFormField();
  }

  Widget _buttonSave() {
    return ElevatedButton(
      child: const Text('Save Task'),
      onPressed: () {},
    );
  }

  void _selectDate(BuildContext context) {
    DateTime picked = showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        ) as DateTime;
  }

}
