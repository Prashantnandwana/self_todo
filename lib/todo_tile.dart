import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  // final String id;
  final String task;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function()? deleteTask;

  TodoTile({
    super.key,
    // required this.id,
    required this.task,
    required this.taskCompleted,
    required this.onChanged,
   required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(value: taskCompleted, onChanged: onChanged),
          Text(
            task,
            style: taskCompleted
                ? TextStyle(decoration: TextDecoration.lineThrough)
                : TextStyle(decoration: TextDecoration.none),
          ),
          Container(child: IconButton(onPressed: deleteTask, icon: Icon(Icons.delete)),)
        ],
      ),
    );
  }
}


// ListTile(
//       leading: IconButton(icon: Icon(Icons.check_box), 
//                 onPressed: () {}),
//       title:    Text("do task",style: TextStyle(decoration: TextDecoration.lineThrough),),
//       trailing: IconButton(onPressed:isDoneMethod, 
//                 icon: Icon(Icons.delete)),
//     );