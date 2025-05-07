import 'package:sqflite/sqflite.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/todo.dart';

abstract interface class TodoRepository {
  const TodoRepository();

  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> editTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
}

final class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({required Database db}) : _db = db;

  final Database _db;

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await _db.query(Tables.todos);
    return todos.map((map) {
      return Todo.fromMap(map);
    }).toList();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    await _db.insert(
      Tables.todos,
      todo.toMap(),
    );
  }

  @override
  Future<void> editTodo(Todo todo) async {
    await _db.update(
      Tables.todos,
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await _db.delete(
      Tables.todos,
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
}
