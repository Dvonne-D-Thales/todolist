import 'package:flutter/material.dart';
import 'package:todolist/widgets/custom_textfield.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Tugas")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Judul Tugas", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            CustomTextField(
              label: "Masukkan judul tugas",
              controller: titleController,
            ),
            const SizedBox(height: 20),
            const Text("Deskripsi", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            CustomTextField(
              label: "Masukkan deskripsi tugas",
              controller: descController,
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty || descController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Judul dan deskripsi harus diisi")),
                  );
                } else {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Tugas berhasil ditambahkan")),
                  );
                }
              },
              child: const Text("Simpan"),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
