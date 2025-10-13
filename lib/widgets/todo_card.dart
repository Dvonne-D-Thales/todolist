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

    // Responsive font + layout scaling
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
                // Expanded supaya teks pakai sisa ruang dan bisa turun ke bawah
                Expanded(
                  child: Text(
                    title,
                    softWrap: true,
                    overflow: TextOverflow.visible,
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

                // Tambahkan sedikit jarak agar tidak dempet
                const SizedBox(width: 8),

                // Tombol check
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
              maxLines: isWide ? 4 : 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: descSize, color: Colors.black87),
            ),

            const SizedBox(height: 12),

            // Category + delete button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category: $category",
                  style: TextStyle(
                    fontSize: categorySize,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
      ),
    );
  }
}
