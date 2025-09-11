import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final VoidCallback? onDelete;
  final bool isDone;
  final VoidCallback? onCheck;

  const TodoCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    this.onDelete,
    this.isDone = false,
    this.onCheck,
  });

  Color _getCategoryColor() {
    switch (category.toLowerCase()) {
      case "personal":
        return Colors.green.shade100; // hijau muda
      case "school":
        return Colors.yellow.shade100; // kuning lembut
      case "business":
        return Colors.lightBlue.shade100; // biru muda
      default:
        return Colors.grey.shade200; // fallback warna netral
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getCategoryColor(),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: IconButton(
          icon: Icon(isDone ? Icons.check_box : Icons.check_box_outline_blank),
          onPressed: onCheck,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            const SizedBox(height: 4),
            Text(
              'Category: $category',
              style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
