import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  ToDoAppState createState() => ToDoAppState();
}

class ToDoAppState extends State<ToDoApp> {
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  void savinTasks() {
    tasks.add(taskController.text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      home: Scaffold(
        appBar: AppBar(
          title: Text("To-Do-App"),
          backgroundColor: const Color.fromARGB(255, 11, 113, 64),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: taskController,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Enter Task',
                  hintText: 'TASK --',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 92, 132, 225)),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (taskController.text.isNotEmpty) {
                savinTasks();
                taskController.clear();
              }
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
