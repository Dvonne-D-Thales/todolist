import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/routes/routes.dart';

class AuthController extends GetxController {
  final correctUsername = "a";
  final correctPassword = "a";

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
) async {
  if (email == correctUsername && password == correctPassword) {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", email);

    Get.offAllNamed(Routes.splashscreen);
  } else if (email.isEmpty && password.isEmpty) {
    Get.defaultDialog(
      title: "Input Please",
      middleText: "Input email dan password kosong",
      textConfirm: "OK",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
      },
    );
  } else {
    Get.defaultDialog(
      title: "PEYUSUP!!!",
      middleText: "Penyusup tidak dikenal, silahkan coba lagi",
      textConfirm: "OK",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
      },
    );

    emailController.clear();
    passwordController.clear();
  }
}

  }

