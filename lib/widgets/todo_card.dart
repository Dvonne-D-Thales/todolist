import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onDelete;
  final bool isDone;
  final VoidCallback? onCheck;

  const TodoCard({
    super.key,
    required this.title,
    required this.description,
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
        subtitle: Text(description),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
