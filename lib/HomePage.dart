import 'package:flutter/material.dart';
import 'package:self_todo/todo_tile.dart';

class HomePage extends StatefulWidget {
  final controller;
  const HomePage({super.key, this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  void addTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  List toDoList = [
    ["make tutorial", false],
    ["do exe ", false],
  ];
  final _controller = TextEditingController();
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.yellow[300],
          content: Container(
            height: 120,
            child: Column(
              children: [
                TextField(
                controller: _controller ,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: addTask,
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.cancel),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO "),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Text("+"),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            task: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
