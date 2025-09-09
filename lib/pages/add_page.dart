import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/add_controller.dart';
import 'package:todolist/widgets/costum_card.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/dropdown_buttonfield.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  final AddController controller = Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 240, 250),
      appBar: AppBar(
        title: const Text("Tambah Tugas"),
        backgroundColor: const Color.fromARGB(255, 230, 240, 250),
      ),
      resizeToAvoidBottomInset: true,
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
              DropdownButtonfield(
                onChanged: controller.setCategory,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Simpan',
                  onPressed: controller.saveTask,
                  borderRadius: 5,
                  elevation: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
