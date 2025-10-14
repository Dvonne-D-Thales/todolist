import 'package:get/get.dart';
import 'package:todolist/controllers/edit_controller.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditController>(() => EditController());
  }
}
