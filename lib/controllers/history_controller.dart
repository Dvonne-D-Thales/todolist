import 'package:get/get.dart';
import 'package:todolist/models/todolist_model.dart';

class HistoryController extends GetxController{
    var history = <TodoItem>[].obs;

  void addToHistory(TodoItem item) {
    history.add(item);
  }
}