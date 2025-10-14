import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;  // <- Tombol Edit
  final bool isDone;
  final VoidCallback? onCheck;

  const TodoCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    this.onDelete,
    this.onEdit, // <- Tombol Edit
    this.isDone = false,
    this.onCheck,
  });

  Color _getCategoryColor() {
    switch (category.toLowerCase()) {
      case "personal":
        return Colors.green.shade100;
      case "school":
        return Colors.yellow.shade100;
      case "business":
        return Colors.lightBlue.shade100;
      default:
        return Colors.grey.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final bool isWide = screenWidth > 900;
    final double titleSize = isWide ? 22 : 18;
    final double descSize = isWide ? 16 : 14;
    final double categorySize = isWide ? 15 : 12;
    final double iconSize = isWide ? 28 : 22;
    final double padding = isWide ? 24 : 14;

    return Card(
      elevation: isWide ? 6 : 3,
      color: _getCategoryColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isWide ? 18 : 12),
      ),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + check button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      decoration: isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(
                    isDone ? Icons.check_box : Icons.check_box_outline_blank,
                    size: iconSize,
                    color: isDone ? Colors.green : Colors.black54,
                  ),
                  onPressed: onCheck,
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Description
            Text(
              description,
              softWrap: true,
              style: TextStyle(fontSize: descSize, color: Colors.black87),
            ),

            const SizedBox(height: 12),

            // Category + edit + delete buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "Category: $category",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: categorySize,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: [
                    if (onEdit != null)
                      IconButton(
                        icon: Icon(
                          Icons.edit_outlined,
                          color: Colors.deepPurple,
                          size: iconSize,
                        ),
                        onPressed: onEdit,
                      ),
                    if (onDelete != null)
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.redAccent,
                          size: iconSize,
                        ),
                        onPressed: onDelete,
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
