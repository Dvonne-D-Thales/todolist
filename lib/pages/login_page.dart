import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/auth_controller.dart';
import 'package:todolist/pages/register_page.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/costum_card.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/costum_text.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

   final loginController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 240, 250),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: CostumCard(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xFFEEEEEE),
                        child: Icon(
                          Icons.person_outline,
                          size: 40,
                          color: Colors.deepPurple,
                        ),
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
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      onPressed: () {
                        final authController = Get.find<AuthController>();
                        authController.login(
                          loginController.emailController.text.trim(),
                          loginController.passwordController.text.trim(),
                          loginController.emailController,
                          loginController.passwordController,
                        );
                      },
                      borderRadius: 16,
                      elevation: 4,
                    ),
                    const SizedBox(height: 14),
                    CustomButton(
                      text: "Register",
                      color: Colors.grey[200],
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      borderRadius: 16,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
