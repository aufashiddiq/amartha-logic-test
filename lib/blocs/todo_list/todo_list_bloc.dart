import 'dart:async';

import 'package:amartha_logic_test/models/todo_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState()) {
    on<AddTodoEvent>(_addTodoEvent);
    on<ToggleTodoEvent>(_toggleTodoEvent);
  }

  FutureOr<void> _addTodoEvent(
    AddTodoEvent event,
    Emitter<TodoListState> emit,
  ) async {
    final Box<TodoModel> todoBox = Hive.box('todoBox');
    todoBox.add(TodoModel(text: event.text));
  }

  FutureOr<void> _toggleTodoEvent(
    ToggleTodoEvent event,
    Emitter<TodoListState> emit,
  ) async {
    final Box<TodoModel> todoBox = Hive.box('todoBox');
    TodoModel? todoItem = todoBox.getAt(event.index);
    todoItem?.hasDone = event.checked;
    todoItem?.save();
  }
}
