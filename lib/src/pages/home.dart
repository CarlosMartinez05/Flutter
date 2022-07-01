import 'package:flutter/material.dart';
import 'package:task_tools/src/pages/taskForm.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<String> tasks = <String>[];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('App ToDo'),
            bottom: const TabBar(tabs: [
              Tab(text: ('Tasks'),),
              Tab(text: ('New Task'),)
            ],),
          ),
          body: const TabBarView(children: [
            Center(child: Text("List"),),
            Center(child: TaskForm(),)
          ],),
        )
    );
  }


}
