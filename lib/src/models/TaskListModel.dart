import 'package:scoped_model/scoped_model.dart';
import 'package:task_tools/src/models/TaskModel.dart';

class TaskListModel extends Model {
     List<TaskModel> _taskList = <TaskModel>[];

    List<TaskModel> get tasksList => _taskList;

    void add(TaskModel task) {
    _taskList.add(task);
    notifyListeners();
    }
  }