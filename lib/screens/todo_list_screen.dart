import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  static const routeName = '/todo-list';
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: 24);
        },
        itemCount: 10,
        padding: EdgeInsets.all(24),
        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  'S',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 24),
              Text('Test', style: TextStyle(fontSize: 20)),
            ],
          );
        },
      ),
    );
  }
}
