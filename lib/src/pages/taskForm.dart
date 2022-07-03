//import for Task Form
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:task_tools/src/models/TaskListModel.dart';
import 'package:task_tools/src/models/TaskModel.dart';
import 'package:intl/intl.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key}) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _inputTitle = TextEditingController();

  final TextEditingController _inputDate = TextEditingController();

  Energy _inputEnergy = Energy.low;


  @override
//Widget Build Field For Task Form, title,Date,Energy && Create Button For Save
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

  Widget _fieldTitle() {
    return TextFormField(
      controller: _inputTitle,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Your Writing minimum 5Characters';
        }
        return null;
      },
    );
  }

  Widget _fieldDate(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _inputDate,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Select Date For Task';
        }
        return null;
      },
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }


  Widget _fieldEnergy() {
    return DropdownButton(
      value: _inputEnergy,
      items: [
        DropdownMenuItem(
          value: Energy.low,
          child: Text(Energy.low.toString()),),
        DropdownMenuItem(
          value: Energy.medium,
          child: Text(Energy.medium.toString()),),
        DropdownMenuItem(
          value: Energy.high,
          child: Text(Energy.high.toString()),)
      ],
      onChanged: (Energy? value) {
        setState(() {
          _inputEnergy = value!;
        });
      },
    );
  }

  Widget _buttonSave() {
    return ElevatedButton(
      child: const Text('Save Task'),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScopedModel.of<TaskListModel>(context, rebuildOnChange: true)
              .add(_createTask());
        }
      },
    );
  }

  DateTime selectedDate = DateTime.now();

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(DateTime
            .now()
            .year - 5),
        lastDate: DateTime(DateTime
            .now()
            .year + 5));

    if (picked != null) {
      setState(() {
        String day = '${picked.day}';
        if (picked.day < 10) {
          day = '0${picked.day}';
        }
        _inputDate.text = '${picked.year}-${picked.month}-$day';
      });
    }
  }


  TaskModel _createTask() {
    return TaskModel(
        _inputTitle.text,
        DateFormat("yyyy-MM-dd").parse(_inputDate.text),
        _inputEnergy
    );
  }
}