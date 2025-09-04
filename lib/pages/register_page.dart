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
      appBar: AppBar(title: const Text("Register Page")),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      }, borderRadius: 12, elevation: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
