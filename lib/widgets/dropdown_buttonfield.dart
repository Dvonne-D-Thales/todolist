import 'package:flutter/material.dart';

class DropdownButtonfield extends StatelessWidget {
  final String? value;
  final Function(String?)? onChanged;

  const DropdownButtonfield({
    super.key,
    this.value,
    this.onChanged,
  });

  final List<String> items = const ["School", "Business", "Personal"];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: "Kategori",
        border: OutlineInputBorder(),
      ),
      value: value, // value dikontrol dari luar
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
