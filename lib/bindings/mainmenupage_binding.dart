import 'package:get/get.dart';
import 'package:todolist/controllers/auth_controller.dart';
import 'package:todolist/controllers/history_controller.dart';
import 'package:todolist/controllers/navbar_controller.dart';
import 'package:todolist/controllers/splashscreen_controller.dart';
import 'package:todolist/controllers/todolist_controller.dart';

class MainmenupageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(()=>SplashscreenController());
    Get.lazyPut<NavbarController>(()=>NavbarController());
    Get.lazyPut<AuthController>(()=>AuthController());
    Get.lazyPut<TodoController>(()=>TodoController());
    Get.lazyPut<HistoryController>(()=>HistoryController());
  }
  
}