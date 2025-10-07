import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/routes/routes.dart';

class AuthController extends GetxController {
  final correctUsername = "a";
  final correctPassword = "a";
  var obscurePassword = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    Get.offAllNamed(Routes.login);
  }

  void login(
    String email,
    String password,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async{
    if (email == correctUsername && password == correctPassword) {
       final prefs = await SharedPreferences.getInstance();
          prefs.setString("username", emailController.text.toString());
          Get.offAllNamed(Routes.mainmenu);
    } else if (email.isEmpty && password.isEmpty) {
      Get.defaultDialog(
        title: "Input Please",
        middleText: "Input email dan password kosong",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back; // tutup dialog
        },
      );
    } else {
      Get.defaultDialog(
        title: "PEYUSUP!!!",
        middleText: "Penyusup tidak dikenal, silahkan coba lagi",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back(); // tutup dialog
        },
      );

      // clear input
      emailController.clear();
      passwordController.clear();
    }
  }
}
