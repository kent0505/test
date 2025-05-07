import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/todo.dart';
import '../data/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository;

  TodoBloc({required TodoRepository repository})
      : _repository = repository,
        super(TodoInitial()) {
    on<TodoEvent>(
      (event, emit) => switch (event) {
        GetTodos() => _getTodos(event, emit),
        AddTodo() => _addTodo(event, emit),
        EditTodo() => _editTodo(event, emit),
        DeleteTodo() => _deleteTodo(event, emit),
      },
    );
  }

  void _getTodos(
    GetTodos event,
    Emitter<TodoState> emit,
  ) async {
    List<Todo> todos = await _repository.getTodos();
    emit(TodosLoaded(todos: todos));
  }

  void _addTodo(
    AddTodo event,
    Emitter<TodoState> emit,
  ) async {
    await _repository.addTodo(event.todo);
    add(GetTodos());
  }

  void _editTodo(
    EditTodo event,
    Emitter<TodoState> emit,
  ) async {
    await _repository.editTodo(event.todo);
    add(GetTodos());
  }

  void _deleteTodo(
    DeleteTodo event,
    Emitter<TodoState> emit,
  ) async {
    await _repository.deleteTodo(event.todo);
    add(GetTodos());
  }
}
