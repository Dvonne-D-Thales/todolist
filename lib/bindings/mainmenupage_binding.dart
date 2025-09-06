import 'package:get/get.dart';
import 'package:todolist/controllers/navbar_controller.dart';

class MainmenupageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(()=>NavbarController());
  }
  
}