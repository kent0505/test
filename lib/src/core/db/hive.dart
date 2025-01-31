import 'package:hive_flutter/hive_flutter.dart';

import '../models/model.dart';

List<Model> modelsList = [];

const boxName = 'boxName';
const keyName = 'keyName';

Future<void> initHive() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('boxname');
  Hive.registerAdapter(ModelAdapter());
}

Future<void> getModels() async {
  final box = await Hive.openBox(boxName);
  List data = box.get(keyName) ?? [];
  modelsList = data.cast<Model>();
}

Future<void> updateModels() async {
  final box = await Hive.openBox(boxName);
  box.put(keyName, modelsList);
  modelsList = await box.get(keyName);
}
