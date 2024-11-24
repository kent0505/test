import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/test_model.dart';
import '../utils.dart';

class DB {
  late Database _db;
  final String _tableName = 'test_models';

  Future<void> init() async {
    try {
      logger('INIT DB');
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'test_model.db');
      _db = await openDatabase(
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
    } on Object catch (error, stackTrace) {
      logger(error);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<List<TestModel>> getModels() async {
    try {
      final List<Map<String, dynamic>> maps = await _db.query(_tableName);
      return List.generate(
        maps.length,
        (index) {
          return TestModel.fromMap(maps[index]);
        },
      );
    } on Object catch (error, stackTrace) {
      logger(error);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<List<TestModel>> addModel(TestModel model) async {
    try {
      await _db.insert(
        _tableName,
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return await getModels();
    } on Object catch (error, stackTrace) {
      logger(error);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<List<TestModel>> editModel(TestModel model) async {
    try {
      await _db.update(
        _tableName,
        model.toMap(),
        where: 'id = ?',
        whereArgs: [model.id],
      );
      return await getModels();
    } on Object catch (error, stackTrace) {
      logger(error);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<List<TestModel>> deleteModel(TestModel model) async {
    try {
      await _db.delete(
        _tableName,
        where: 'id = ?',
        whereArgs: [model.id],
      );
      return await getModels();
    } on Object catch (error, stackTrace) {
      logger(error);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
