import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todolist/models/todolist_model.dart';
import 'package:todolist/database/todolist_crud.dart';


class HistoryController extends GetxController {
  var history = <TodoItem>[].obs;
  final TodoListDatabase _database = TodoListDatabase();

  @override
  void onInit() {
    super.onInit();
    loadHistory();
  }

  void loadHistory() async {
    final loadedHistory = await _database.readHistory();
    history.assignAll(loadedHistory);
  }

  void addToHistory(TodoItem item) async {
    await _database.addToHistory(item);
    history.add(item);
  }

  void deleteHistory(int index) async {
    final item = history[index];
    if (item.id != null) {
     await _database.deleteHistory(item.id!);
      history.removeAt(index);
    }
  }

  void handleDelete(BuildContext context, int index) {
    final title = history[index].title;
    Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Apakah kamu yakin ingin menghapus '$title' dari history?",
      textCancel: "Batal",
      textConfirm: "Hapus",
      confirmTextColor: Colors.white,
      onConfirm: () {
        deleteHistory(index);
        Get.back();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Deleted $title")),
        );
      },
    );
  }
}
