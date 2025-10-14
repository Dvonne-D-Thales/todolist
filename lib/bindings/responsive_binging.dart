import 'package:get/get.dart';
import 'package:todolist/controllers/responsive_controller.dart'; 

class ResponsiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResponsiveController>(() => ResponsiveController());
  }
}

