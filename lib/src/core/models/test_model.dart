class TestModel {
  TestModel({
    this.id = 0,
    required this.title,
  });

  int id;
  String title;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      id: map['id'],
      title: map['title'],
    );
  }
}


// import 'package:hive_flutter/hive_flutter.dart';

// @HiveType(typeId: 0)
// class Model {
//   @HiveField(0)
//   final int id;
//   @HiveField(1)
//   String title;

//   Model({
//     required this.id,
//     required this.title,
//   });
// }

// class ModelAdapter extends TypeAdapter<Model> {
//   @override
//   final typeId = 0;

//   @override
//   Model read(BinaryReader reader) {
//     return Model(
//       id: reader.read(),
//       title: reader.read(),
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Model obj) {
//     writer.write(obj.id);
//     writer.write(obj.title);
//   }
// }