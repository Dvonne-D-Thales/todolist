import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/pages/mainmenu_page.dart';
import 'package:todolist/pages/register_page.dart';
import 'package:todolist/routes/routes.dart';
import 'package:todolist/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String correctEmail = "jangkar";
  final String correctPassword = "123";

  void handleLogin() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email == correctEmail && password == correctPassword) {
      showDialog(

        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Login Successful"),
            content: Text("Welcome, $email!"),
            actions: [
              TextButton(
                onPressed: () {
                  Get.offAllNamed('/mainmenu');
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else if (email == "" && password == "") {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Input Please"),
            content: Text("input email dan password kosong"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("PEYUSUP!!!"),
              content: Text("penyusup tidak dikenal, silahkan coba lagi"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      });
      emailController.clear();
      passwordController.clear();
    }
  }

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
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.deepPurple.withOpacity(0.2),
                              blurRadius: 16,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
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
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.person_outline),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      CustomButton(
                        text: "Login",
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        onPressed: () {
                          Get.offAllNamed(Routes.login);
                          handleLogin();
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
      ),
    );
  }
}
