import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/auth_controller.dart';
import 'package:todolist/pages/mobile/register_mobile_page.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/costum_card.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/costum_text.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    const Color background = Color(0xFFF9FAFB);
    const Color primaryBlue = Color(0xFF1E3A8A);
    

    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: CostumCard(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: background,
                    child: Icon(
                      Icons.person_outline,
                      size: 40,
                      color: primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CostumText.heading('Welcome'),
                  CostumText.subtitle("Login to continue"),
                  const SizedBox(height: 36),
                  CustomTextField(
                    label: "Username",
                    controller: loginController.emailController,
                    prefixIcon: Icons.person,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
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
                      maxLines: 1,
                      prefixIcon: Icons.lock,
                    ),
                  ),
                  const SizedBox(height: 28),
                  CustomButton(
                    text: "Login",
                    color: primaryBlue,
                    textColor: Colors.white,
                    onPressed: () {
                      loginController.login(
                        loginController.emailController.text.trim(),
                        loginController.passwordController.text.trim(),
                        loginController.emailController,
                        loginController.passwordController,
                      );
                    },
                    borderRadius: 16,
                    elevation: 0,
                  ),
                  const SizedBox(height: 14),
                  CustomButton(
                    text: "Register",
                    color: Colors.white,
                    textColor: primaryBlue,
                    borderRadius: 16,
                    elevation: 0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
