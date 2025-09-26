class TodoItem {
  final String title;
  final String description;
  final String category; // Add this line
  final bool isDone;

  TodoItem({
    required this.title,
    required this.description,
    required this.category, // Add this line
    this.isDone = false,
  });
}