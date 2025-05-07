part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class GetTodos extends TodoEvent {}

final class AddTodo extends TodoEvent {
  AddTodo({required this.todo});

  final Todo todo;
}

final class EditTodo extends TodoEvent {
  EditTodo({required this.todo});

  final Todo todo;
}

final class DeleteTodo extends TodoEvent {
  DeleteTodo({required this.todo});

  final Todo todo;
}
