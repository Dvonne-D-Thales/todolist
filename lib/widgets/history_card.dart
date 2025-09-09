import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String title;
  final String description;
  final String category; // Tambahkan ini
  final VoidCallback? onDelete;
  final List<Widget> children;

  const HistoryCard({
    super.key,
    required this.title,
    required this.description,
    required this.category, // Tambahkan ini
    this.onDelete,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (onDelete != null)
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: onDelete,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 4),
            Text(
              'Category: $category',
              style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
        
      ),
    );
  }
}
