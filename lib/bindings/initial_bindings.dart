import 'package:get/get.dart';
import 'package:todolist/controllers/auth_controller.dart';
import 'package:todolist/controllers/todolist_controller.dart';
import 'package:todolist/controllers/history_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Controller global, dipakai seumur hidup app
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<TodoController>(TodoController(), permanent: true);
    Get.put<HistoryController>(HistoryController(), permanent: true);
  }
}
