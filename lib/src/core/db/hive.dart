import 'package:hive_flutter/hive_flutter.dart';

import '../models/model.dart';

List<Model> modelsList = [];

Future<void> getModels() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('test_box');
  Hive.registerAdapter(ModelAdapter());
  final box = await Hive.openBox('test_box');
  List data = await box.get('modelsList') ?? [];
  modelsList = data.cast<Model>();
}

Future<void> updateModels() async {
  final box = await Hive.openBox('test_box');
  await box.put('modelsList', modelsList);
  modelsList = await box.get('modelsList');
}

// Future<List<Model>> getModels() async {
//   await Hive.initFlutter();
//   // await Hive.deleteBoxFromDisk('test_box');
//   Hive.registerAdapter(ModelAdapter());
//   final box = await Hive.openBox('test_box');
//   List data = await box.get('models') ?? [];
//   return data.cast<Model>();
// }

// Future<List<Model>> updateModels(List<Model> models) async {
//   final box = await Hive.openBox('test_box');
//   await box.put('models', models);
//   return await box.get('models');
// }
