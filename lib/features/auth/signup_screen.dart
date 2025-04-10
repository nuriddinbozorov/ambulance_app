import 'package:flutter/material.dart';

import '../../config/widget/w_button.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isEmailVerified = false;
  bool isPasswordVerified = false;
  String? emailError;
  String? passwordError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create your account",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: _getInputDecoration(
                          label: 'Full Name',
                          errorText: emailError,
                          isVerified: isEmailVerified),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: _getInputDecoration(
                          label: 'Email',
                          errorText: emailError,
                          isVerified: isEmailVerified),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: _getInputDecoration(
                          label: 'Password',
                          errorText: passwordError,
                          isVerified: isPasswordVerified),
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: _getInputDecoration(
                          label: 'Confirm Password',
                          errorText: passwordError,
                          isVerified: isPasswordVerified),
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    WButton(
                        text: "Sign up",
                        onTap: () {
                          emailError = null;
                          passwordError = null;
                          if (emailController.text.isNotEmpty &&
                              emailController.text.contains('@')) {
                            isEmailVerified = true;
                          } else {
                            emailError = "Noto'g'ri parol kiritildi";
                          }

                          if (passwordController.text.isNotEmpty &&
                              passwordController.text.length >= 6) {
                            isPasswordVerified = true;
                          } else {
                            passwordError =
                                "Parol 6 ta belgidan iborat bo'lsin";
                          }
                          setState(() {});
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Wrap(
                        children: [
                          const Text("Already have an account?",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF666666),
                              )),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const LoginScreen()));
                            },
                            child: const Text("Login",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFF6600),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getInputDecoration(
          {required String label,
          bool isVerified = false,
          String? errorText}) =>
      InputDecoration(
        suffixIcon: isVerified
            ? const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.deepOrange,
                ))
            : null,
        label: Text(label),
        errorText: errorText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFEEEEEE),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFF6600),
          ),
        ),
        labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFFAAAAAA)),
      );
}
