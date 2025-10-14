import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/add_controller.dart';
import 'package:todolist/widgets/costum_card.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/dropdown_buttonfield.dart';

class AddWidescreenPage extends StatelessWidget {
  AddWidescreenPage({super.key});

  final controller = Get.find<AddController>();

  // 👉 Item dropdown sekarang diatur di page
  final List<Map<String, dynamic>> categories = const [
    {"label": "School", "icon": Icons.school},
    {"label": "Business", "icon": Icons.business_center},
    {"label": "Personal", "icon": Icons.person},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 240, 250),
      appBar: AppBar(
        title: const Text("Tambah Tugas"),
        backgroundColor: const Color.fromARGB(255, 230, 240, 250),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: CostumCard(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Judul Tugas", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              CustomTextField(
                label: "Masukan Judul",
                controller: controller.titleController,
                maxLines: 1,
                prefixIcon: Icons.title,
              ),

              const SizedBox(height: 20),
              const Text("Deskripsi", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              CustomTextField(
                label: "Masukkan deskripsi",
                controller: controller.descController,
                maxLines: 3,
                prefixIcon: Icons.description,
              ),

              const SizedBox(height: 20),
              const Text("Kategori", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Obx(() {
                return DropdownButtonfield(
                  value: controller.category.value.isEmpty
                      ? null
                      : controller.category.value,
                  items: categories,
                  onChanged: (value) {
                    // 🔹 Schedule reactive update after current frame
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      controller.setCategory(value);
                    });
                  },
                );
              }),

              const SizedBox(height: 32),
              Center(
                child: CustomButton(
                  text: "Simpan",
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  onPressed: () {
                    controller.saveTask(context);
                  },
                  borderRadius: 16,
                  elevation: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
