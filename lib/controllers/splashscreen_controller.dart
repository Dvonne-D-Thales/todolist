import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/routes/routes.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    // Tampilkan splash selama 2-3 detik
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');

    if (savedUsername != null) {
      // Sudah login -> lanjut ke main menu
      Get.offAllNamed(Routes.mainmenu);
    } else {
      // Belum login -> kembali ke login
      Get.offAllNamed(Routes.login);
    }
  }
}
