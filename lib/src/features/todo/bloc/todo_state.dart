part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodosLoaded extends TodoState {
  TodosLoaded({required this.todos});

  final List<Todo> todos;
}
