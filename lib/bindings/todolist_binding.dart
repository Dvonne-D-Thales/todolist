import 'package:get/get.dart';

import 'package:todolist/controllers/todolist_controller.dart';

class TodolistBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<TodoController>(()=>TodoController());
  }
}