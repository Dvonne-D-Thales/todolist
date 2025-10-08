class TodoItem {
  final int? id;
  final String title;
  final String description;
  final String category;
  final bool isDone;

  TodoItem({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
  });

  // ✅ Ubah objek TodoItem menjadi Map (untuk disimpan ke database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'isDone': isDone ? 1 : 0, // simpan bool sebagai integer
    };
  }

  // ✅ Ubah Map (hasil dari database) menjadi objek TodoItem
  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      isDone: (map['isDone'] as int) == 1,
    );
  }
}
