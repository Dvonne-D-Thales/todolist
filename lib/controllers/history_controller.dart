import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todolist/models/todolist_model.dart';

class HistoryController extends GetxController {
  var history = <TodoItem>[].obs;

  void addToHistory(TodoItem item) {
    history.add(item);
  }

  void deleteHistory(int index) {
    history.removeAt(index);
  }

  void handleDelete(BuildContext context, int index) {
    final title = history[index].title;
    deleteHistory(index);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Deleted $title from history')),
    );
  }
}
