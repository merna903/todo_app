import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  TextEditingController controller;
  Function()? onPressed;
  DialogBox({super.key, required this.controller, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: SizedBox(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          const Text('Add Task'),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Task Name',
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: onPressed, child: const Text('Add')),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text('Cancel')),
            ],
            ),
        ],
        ),
      ),
    );
  }
}