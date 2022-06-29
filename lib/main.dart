import 'package:flutter/material.dart';
import 'models/task.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
 // ToDoList({ Key? Key }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ToDoListState();
  }
}
class ToDoListState extends State<ToDoList> {
  List <Task> ToDoList;

  @override
  Widget build(BuildContext context) {
    if(ToDoList === null)
      ToDoList=[];

    return Scaffold(
      appBar: AppBar(
        title: Text('To Do Task')
      ),
      body: ListView.builder(
        itemCount: ToDoList.length,
        itemBuilder:
        (BuildContext context, int posicion) {
          final item = ToDoList[posicion];
          return new GestureDetector(
            onTap: (){
              _editTask(ToDoList, this.posicion);
            },
            child: Dismissible(
              key: Key(item.name),
              onDismissed: (direction) {
                delete(posicion)
              },
            ),
          );
        })
    );
  }
}