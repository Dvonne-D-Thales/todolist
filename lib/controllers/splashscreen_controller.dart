import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/routes/routes.dart';


class SplashscreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();

    final savedUsername = prefs.getString('username');
    if (savedUsername != null) {
      //jika ada username, langsung ke main menu
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.mainmenu);
      });
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}