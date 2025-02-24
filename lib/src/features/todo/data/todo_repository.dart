import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/todo.dart';

abstract interface class TodoRepository {
  const TodoRepository();

  Future<List<Todo>> getTodos();

  Future<List<Todo>> updateTodos(List<Todo> todos);
}

final class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({required Box box}) : _box = box;

  final Box _box;

  @override
  Future<List<Todo>> getTodos() async {
    List data = await _box.get(Keys.todos) ?? [];
    return data.cast<Todo>();
  }

  @override
  Future<List<Todo>> updateTodos(List<Todo> todos) async {
    // final box = await Hive.openBox('test_box');
    await _box.put(Keys.todos, todos);
    return await _box.get(Keys.todos);
  }
}
