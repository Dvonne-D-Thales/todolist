import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/register_controller.dart';
import 'package:todolist/pages/mobile/login_mobile_page.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/datetime.dart';
import 'package:todolist/widgets/costum_card.dart';
import 'package:todolist/widgets/costum_text.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 230, 240, 250),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 240, 250),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: CostumCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CostumText.heading('Register'),
                    const SizedBox(height: 30),
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: "Username",
                      controller: registerController.usernameController,
                      maxLines: 1,
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => CustomTextField(
                        label: "Password",
                        controller: registerController.passwordController,
                        isPassword: true,
                        obscureText: registerController.obscurePassword.value,
                        onToggleVisibility: () {
                          registerController.obscurePassword.value =
                              !registerController.obscurePassword.value;
                        },
                        maxLines: 1,
                        prefixIcon: Icons.lock,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => CustomDateField(
                        label: "Tanggal Lahir",
                        selectedDate: registerController.birthDate.value,
                        onDateSelected: (date) {
                          registerController.birthDate.value = date;
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: Center(
                        child: CustomButton(
                          text: "Register",
                          onPressed: () {
                            if (registerController
                                    .usernameController
                                    .text
                                    .isEmpty ||
                                registerController
                                    .passwordController
                                    .text
                                    .isEmpty ||
                                registerController.birthDate.value == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please fill all fields"),
                                ),
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            }
                          },
                          borderRadius: 12,
                          elevation: 12,
                        ),
                      ),
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
