import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDpTile extends StatelessWidget {

  final String taskName;
  bool isDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  ToDpTile({super.key,required this.taskName,required this.isDone,required this.onChanged,required this.deleteTask});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0,right: 25,top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              label: 'Delete',
              backgroundColor: Colors.red[300]!,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Text(taskName, style: TextStyle(decoration:isDone? TextDecoration.lineThrough: TextDecoration.none),),
            leading: Checkbox(
              activeColor: Colors.black,
              value: isDone,
              onChanged: onChanged,
            ),
          )
          ),
      ),
    );
  }
}