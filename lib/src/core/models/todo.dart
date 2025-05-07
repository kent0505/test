class Todo {
  Todo({
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

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
    );
  }
}
