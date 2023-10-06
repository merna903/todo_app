import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  final _myBox = Hive.box('todoBox');
  List toDoList = [];

  void loadData(){
      toDoList=_myBox.get("TODOLIST");
  }

  void updateData(){
    _myBox.put("TODOLIST", toDoList);
  }
}