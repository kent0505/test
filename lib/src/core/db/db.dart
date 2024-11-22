import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/test_model.dart';
import '../utils.dart';

class DB {
  late Database db;
  final String _tableName = 'test_models';

  Future<Database> init() async {
    logger('INIT DB');
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'test_model.db');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        logger('ON CREATE');
        await db.execute('''
            CREATE TABLE $_tableName (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT
            )
          ''');
      },
    );
    return db;
  }

  Future<List<TestModel>> getModels() async {
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return TestModel.fromMap(maps[i]);
    });
  }

  Future<List<TestModel>> addModel(TestModel model) async {
    await db.insert(
      _tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return await getModels();
  }

  Future<List<TestModel>> editModel(TestModel model) async {
    await db.update(
      _tableName,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
    return await getModels();
  }

  Future<List<TestModel>> deleteModel(TestModel model) async {
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [model.id],
    );
    return await getModels();
  }
}
