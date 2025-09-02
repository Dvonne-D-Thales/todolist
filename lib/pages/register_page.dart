import 'package:flutter/material.dart';
import 'package:todolist/pages/login_page.dart';
import 'package:todolist/widgets/reusable_textfield.dart';
import 'package:todolist/widgets/reusable_button.dart';
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
                  isPassword: false,
                  controller: nameController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: "Username",
                  isPassword: false,
                  controller: usernameController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: "Password",
                  isPassword: true,
                  controller: passwordController,
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
                    child: CostumButton(
                      text: "Register",
                      textColor: const Color.fromARGB(255, 255, 255, 255),
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
