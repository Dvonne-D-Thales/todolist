import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/auth_controller.dart';
import 'package:todolist/pages/register_page.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/costum_card.dart';
import 'package:todolist/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

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
                      decoration: BoxDecoration(shape: BoxShape.circle),
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
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Login to continue",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 36),
                    CustomTextField(
                      label: "Username",
                      controller: emailController,
                      prefixIcon: Icons.person,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: "Password",
                      controller: passwordController,
                      isPassword: true,
                      obscureText: _obscurePassword,
                      onToggleVisibility: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      maxLines: 1, prefixIcon: Icons.lock,
                    ),
                    const SizedBox(height: 28),
                    CustomButton(
                      text: "Login",
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      onPressed: () {
                        final authController = Get.find<AuthController>();
                        authController.login(
                          context,
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          emailController,
                          passwordController,
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
                            builder: (context) => const RegisterPage(),
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
