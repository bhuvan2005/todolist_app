import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onFieldSubmitted: (value) {
                addTask(value);
              },
              decoration: InputDecoration(
                labelText: 'New Task',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // You can add any additional logic here
                    // (e.g., show a dialog, validate input, etc.)
                    addTask();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addTask([String? task]) {
    if (task != null && task.isNotEmpty) {
      setState(() {
        tasks.add(task);
      });
    }
  }
}
