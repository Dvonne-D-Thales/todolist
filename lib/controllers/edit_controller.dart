import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/todolist_controller.dart';
import 'package:todolist/models/todolist_model.dart';
import 'package:todolist/database/todolist_crud.dart';

class EditController extends GetxController {
  // TextControllers
  late TextEditingController titleController;
  late TextEditingController descController;
  var category = ''.obs;

  late TodoItem todo; 

  void initTodo(TodoItem t) {
    if (t.id == null) {
      throw Exception("Todo ID tidak boleh null!");
    }
    todo = t;
    titleController = TextEditingController(text: t.title);
    descController = TextEditingController(text: t.description);
    category.value = t.category;
  }

  void setCategory(String? value) {
    if (value != null) category.value = value;
  }

 Future<void> saveTask() async {
  if (todo.id == null) {
    Get.snackbar('Error', 'Todo ID tidak valid',
        snackPosition: SnackPosition.BOTTOM);
    return;
  }

  final updatedTodo = TodoItem(
    id: todo.id!,
    title: titleController.text.trim(),
    description: descController.text.trim(),
    category: category.value,
    isDone: todo.isDone,
  );

  await TodoListDatabase().updateTodo(todo.id!, updatedTodo);

  // ✅ Update langsung ke RxList di TodoController
  final todoController = Get.find<TodoController>();
  final index = todoController.todos.indexWhere((t) => t.id == todo.id);
  if (index != -1) {
    todoController.todos[index] = updatedTodo;
    todoController.todos.refresh(); // trigger UI update
  }

  Get.back(); // kembali ke halaman sebelumnya
  Get.snackbar('Sukses', 'Tugas berhasil diperbarui',
      snackPosition: SnackPosition.BOTTOM);
}
}
