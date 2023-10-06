import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/pages/dialog_box.dart';
import 'package:todo_app/pages/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    db.loadData();
    super.initState();
  }
  TextEditingController controller = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  void checkboxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      db.updateData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('To Do'),),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: Container(
        color: Colors.yellow[200],
        child: ListView.builder(itemBuilder:(context,index) => ToDpTile(
          taskName: db.toDoList[index][0],
          isDone: db.toDoList[index][1],
          onChanged: (value) => checkboxChanged(value, index),
          deleteTask: (context) => setState((){
            db.toDoList.removeAt(index);
            db.updateData();}),
        ), itemCount: db.toDoList.length,),
      ),
    );
  }
  
  void createNewTask() {
    showDialog(context: context, builder: (context){
      return DialogBox(controller: controller,onPressed: () => {
        setState(() {
          db.toDoList.add([controller.text, false]);
          db.updateData();
          controller.clear();
        }),
        Navigator.pop(context),
      },);
    });
  }
}