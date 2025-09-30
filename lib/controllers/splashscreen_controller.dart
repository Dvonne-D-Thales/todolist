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
    // jika ada username, langsung ke main menu setelah delay
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.mainmenu);
    });
  } else {
    // tambahkan delay sebelum ke login
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.login);
    });
  }
}
}