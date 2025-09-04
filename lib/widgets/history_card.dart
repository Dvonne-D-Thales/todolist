import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onDelete;

  const HistoryCard({
    super.key,
    required this.title,
    required this.description,
    this.onDelete, required List<ListTile> children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
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
