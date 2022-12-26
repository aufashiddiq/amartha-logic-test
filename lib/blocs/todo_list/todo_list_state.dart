part of 'todo_list_bloc.dart';

class TodoListState extends Equatable {
  final String? todoText;

  const TodoListState({
    this.todoText,
  });

  @override
  List<Object?> get props => [todoText];
}
