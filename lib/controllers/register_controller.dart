import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // Text editing controllers

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // State
  var obscurePassword = true.obs;
  var birthDate = Rxn<DateTime>();

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  bool validateFields() {
    return usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        birthDate.value != null;
  }
}
