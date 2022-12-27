part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final String text;

  const AddTodoEvent(this.text);

  @override
  List<Object?> get props => [text];
}

class ToggleTodoEvent extends TodoListEvent {
  final int index;
  final bool checked;

  const ToggleTodoEvent(this.index, this.checked);

  @override
  List<Object?> get props => [index, checked];
}
