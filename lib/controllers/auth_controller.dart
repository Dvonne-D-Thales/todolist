import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/routes/routes.dart';

class AuthController extends GetxController {
  final correctUsername = "a";
  final correctPassword = "a";

  void login(
    String email,
    String password,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    if (email == correctUsername && password == correctPassword) {
      Get.defaultDialog(
        title: "Login Successful",
        middleText: "Welcome, $email!",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.offAllNamed(Routes.mainmenu);
        },
      );
    } else if (email.isEmpty && password.isEmpty) {
      Get.defaultDialog(
        title: "Input Please",
        middleText: "Input email dan password kosong",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back(); // tutup dialog
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
