import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/TaskListModel.dart';
import '../models/TaskModel.dart';


class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskList =
        ScopedModel.of<TaskListModel>(context, rebuildOnChange: true).tasksList;

    List<ListTile>taskWidget = taskList.map((TaskModel task){
        return ListTile(
          title: Text(task.title),
          subtitle: Text(task.date.toString()),
        );
    }).toList();


    return ListView(
      children: taskWidget,
    );
  }
}
