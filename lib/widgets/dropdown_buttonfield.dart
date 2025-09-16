import 'package:flutter/material.dart';

class DropdownButtonfield extends StatelessWidget {
  final String? value;
  final Function(String?)? onChanged;
  final List<Map<String, dynamic>> items; 

  const DropdownButtonfield({
    super.key,
    this.value,
    this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: "Kategori",
        border: OutlineInputBorder(),
      ),
      value: value,
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item["label"],
          child: Row(
            children: [
              Icon(item["icon"], size: 20, color: Colors.deepPurple),
              const SizedBox(width: 8),
              Text(item["label"]),
            ],
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
