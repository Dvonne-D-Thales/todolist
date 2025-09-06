import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final String category; // Add this line
  final VoidCallback? onDelete;
  final bool isDone;
  final VoidCallback? onCheck;

  const TodoCard({
    super.key,
    required this.title,
    required this.description,
    required this.category, // Add this line
    this.onDelete,
    this.isDone = false,
    this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: IconButton(
          icon: Icon(isDone ? Icons.check_box : Icons.check_box_outline_blank),
          onPressed: onCheck,
        ),
        title: Text(title),
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