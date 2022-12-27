import 'package:amartha_logic_test/blocs/todo_list/todo_list_bloc.dart';
import 'package:amartha_logic_test/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoListScreen extends StatefulWidget {
  static const routeName = '/todo-list';
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late TodoListBloc _bloc;
  final TextEditingController _todoController = TextEditingController();

  @override
  void initState() {
    _bloc = TodoListBloc();
    super.initState();
  }

  void addTodoItem() {
    if (_todoController.text.isNotEmpty) {
      _bloc.add(AddTodoEvent(_todoController.text));
      _todoController.clear();
      Navigator.pop(context);
    }
  }

  void toggleTodoItem(TodoModel item, int index) {
    _bloc.add(ToggleTodoEvent(index, !item.hasDone));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: BlocProvider(
        create: (context) => _bloc,
        child: ValueListenableBuilder<Box<TodoModel>>(
          valueListenable: Hive.box<TodoModel>('todoBox').listenable(),
          builder: (context, box, widget) {
            return _buildList(box);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddTodoDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildList(Box<TodoModel> box) {
    if (box.values.isEmpty) {
      return Container(
        padding: EdgeInsets.all(32),
        alignment: Alignment.topCenter,
        child: Text(
          'Todo list was empty!',
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: 24);
      },
      itemCount: box.values.length,
      padding: EdgeInsets.all(24),
      itemBuilder: (context, index) {
        return _buildItem(box.values.elementAt(index), index);
      },
    );
  }

  InkWell _buildItem(TodoModel item, int index) {
    return InkWell(
      onTap: () => toggleTodoItem(item, index),
      child: Row(
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
          Text(
            item.text,
            style: TextStyle(
              color: item.hasDone ? Colors.black54 : Colors.black,
              fontSize: 20,
              decoration: item.hasDone ? TextDecoration.lineThrough : null,
            ),
          ),
        ],
      ),
    );
  }

  void showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add a new todo item',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      controller: _todoController,
                      decoration:
                          InputDecoration(hintText: 'Type your new todo'),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text('Add'),
                  onPressed: addTodoItem,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
