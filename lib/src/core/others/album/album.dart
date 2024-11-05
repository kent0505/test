class Album {
  Album({
    required this.id,
    required this.userId,
    required this.title,
  });

  final int id;
  final int userId;
  final String title;

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
    );
  }
}
