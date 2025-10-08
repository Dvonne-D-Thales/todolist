import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/routes/routes.dart';


class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

checkLoginStatus() async {
  final prefs = await SharedPreferences.getInstance();

  final savedUsername = prefs.getString('username');
  if (savedUsername != null) {
    
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.mainmenu);
    });
  } else {
   
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.login);
    });
  }
}
}