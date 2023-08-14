import 'package:flutter/material.dart';

import '../model/task_model.dart';

class ToDoItem extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onCheck;
  final bool isChecked;

  const ToDoItem({
    Key? key,
    required this.task,
    required this.onDelete,
    required this.onCheck,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ListTile(
        onTap: () {
          // print('clicked the ListTile');
        },
        contentPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: Colors.white,
        leading: IconButton(
          onPressed: onCheck,
          icon:
              Icon(isChecked ? Icons.check_box : Icons.check_box_outline_blank),
          color: Colors.blue,
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 16,
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: onDelete, // Call the onDelete callback
            icon: const Icon(Icons.delete),
            color: Colors.white,
            iconSize: 20,
          ),
        ),
      ),
    );
  }
}
