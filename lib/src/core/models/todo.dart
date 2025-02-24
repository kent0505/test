import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Todo {
  Todo({
    required this.id,
    required this.title,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  String title;
}

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final typeId = 0;

  @override
  Todo read(BinaryReader reader) {
    return Todo(
      id: reader.readInt(),
      title: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
  }
}
