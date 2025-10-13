import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/auth_controller.dart';
import 'package:todolist/routes/routes.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/costum_text.dart';

class LoginWidescreenPage extends StatelessWidget {
  LoginWidescreenPage({super.key});

  final loginController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    const Color background = Color(0xFFF9FAFB);
    const Color primaryBlue = Color(0xFF1E3A8A);

    return Scaffold(
      backgroundColor: background,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Row(
          children: [
            // LEFT SIDE — LOGIN FORM
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CostumText.heading("Sign In"),
                    const SizedBox(height: 8),
                    CostumText.subtitle("Login to continue"),
                    const SizedBox(height: 48),
                    CustomTextField(
                      label: "Username",
                      controller: loginController.emailController,
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(height: 24),
                    Obx(
                      () => CustomTextField(
                        label: "Password",
                        controller: loginController.passwordController,
                        isPassword: true,
                        obscureText: loginController.obscurePassword.value,
                        onToggleVisibility: () {
                          loginController.obscurePassword.value =
                              !loginController.obscurePassword.value;
                        },
                        prefixIcon: Icons.lock,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            // RIGHT SIDE — BRANDING / ILLUSTRATION
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person_outline,
                        size: 50,
                        color: primaryBlue,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 28,
                        color: primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomButton(
                      text: "Sign In",
                      color: primaryBlue,
                      textColor: Colors.white,
                      borderRadius: 16,
                      elevation: 0,
                      onPressed: () {
                        loginController.login(
                          loginController.emailController.text.trim(),
                          loginController.passwordController.text.trim(),
                          loginController.emailController,
                          loginController.passwordController,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: "Register",
                      color: Colors.white,
                      textColor: primaryBlue,
                      borderRadius: 16,
                      elevation: 0,
                      onPressed: () {
                        Get.toNamed(Routes.register);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
