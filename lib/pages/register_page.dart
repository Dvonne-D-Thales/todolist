import 'package:flutter/material.dart';
import 'package:todolist/pages/login_page.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/datetime.dart';

DateTime? birthDate;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7F7FD5), Color(0xFF86A8E7), Color(0xFF91EAE4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.95),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 32,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        label: "Name",
                        controller: nameController,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: "Username",
                        controller: usernameController,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: "Password",
                        controller: passwordController,
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      CustomDateField(
                        label: "Tanggal Lahir",
                        selectedDate: birthDate,
                        onDateSelected: (date) {
                          setState(() {
                            birthDate = date;
                          });
                        },
                      ),
                      const SizedBox(height: 40),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        child: Center(
                          child: CustomButton(
                            text: "Register",
                            onPressed: () {
                              if (nameController.text.isEmpty ||
                                  usernameController.text.isEmpty ||
                                  passwordController.text.isEmpty ||
                                  birthDate == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please fill all fields"),
                                  ),
                                );
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
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
      ),
    );
  }
}
