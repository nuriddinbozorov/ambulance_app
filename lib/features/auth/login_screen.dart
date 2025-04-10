import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tez_yordam_ilovasi/features/Home/home_screen.dart';
import 'package:tez_yordam_ilovasi/features/auth/signup_screen.dart';

import '../../config/widget/w_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      "WELCOME",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.deepOrange),
                    ),
                    const Text(
                      "Login to your account",
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 36,
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
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    WButton(
                        text: "Login",
                        onTap: () {
                          emailError = null;
                          passwordError = null;
                          if (emailController.text.isNotEmpty &&
                              emailController.text.contains('@')) {
                            isEmailVerified = true;
                          } else {
                            emailError = "Email yoki parol xato";
                          }

                          if (passwordController.text.isNotEmpty &&
                              passwordController.text.length >= 6) {
                            isPasswordVerified = true;
                          } else {
                            passwordError =
                                "Parol 6 ta belgidan iborat bo'lsin";
                          }
                          setState(() {
                            Timer(const Duration(seconds: 2), () {
                              if (isEmailVerified && isPasswordVerified) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomeScreen()));
                              }
                            });
                          });
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    const Center(
                      child: Text(
                        "Forgot the password?",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Wrap(
                        children: [
                          const Text("Don't have an account?",
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
                                      builder: (_) => const SignupScreen()));
                            },
                            child: const Text("Sign up",
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
