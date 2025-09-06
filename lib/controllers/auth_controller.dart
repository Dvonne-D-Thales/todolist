import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/routes/routes.dart';

class AuthController extends GetxController {
  final correctEmail = "jangkar";
  final correctPassword = "123";

  void login(BuildContext context, String email, String password,
      TextEditingController emailController, TextEditingController passwordController) {
    if (email == correctEmail && password == correctPassword) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Login Successful"),
            content: Text("Welcome, $email!"),
            actions: [
              TextButton(
                onPressed: () {
                  Get.offAllNamed(Routes.mainmenu);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else if (email.isEmpty && password.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Input Please"),
            content: const Text("input email dan password kosong"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("PEYUSUP!!!"),
            content: const Text("penyusup tidak dikenal, silahkan coba lagi"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );

      // clear input
      emailController.clear();
      passwordController.clear();
    }
  }
}
