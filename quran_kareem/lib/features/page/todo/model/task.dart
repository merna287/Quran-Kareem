class Task {
  int? id;
  String title;
  String description;
  String date;

  Task({this.id, required this.title, required this.description, required this.date});

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
    };
  }
}
