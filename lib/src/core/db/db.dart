import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/test_model.dart';
import '../utils.dart';

class DB {
  late Database _db;
  final String _tableName = 'test_models';

  Future<void> init() async {
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
  }

  Future<List<TestModel>> getModels() async {
    final maps = await _db.query(_tableName);
    return maps.map((map) => TestModel.fromMap(map)).toList();
  }

  Future<void> addModel(TestModel model) async {
    await _db.insert(
      _tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> editModel(TestModel model) async {
    await _db.update(
      _tableName,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  Future<void> deleteModel(TestModel model) async {
    await _db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }
}

// List listname = [];

// Future<void> initHive() async {
//   await Hive.initFlutter();
//   // await Hive.deleteBoxFromDisk('boxname');
//   Hive.registerAdapter(MoneyAdapter());
// }

// Future<void> getModels() async {
//   final box = await Hive.openBox('boxname');
//   List data = box.get('keyname') ?? [];
//   listname = data.cast<Money>();
// }

// Future<void> updateModels() async {
//   final box = await Hive.openBox('boxname');
//   box.put('keyname', listname);
//   listname = await box.get('keyname');
// }
