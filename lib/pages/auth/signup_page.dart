import 'package:flutter/material.dart';
import 'package:yoga_app/services/auth_services/auth_account_service.dart';

import 'package:yoga_app/utils/widgets/app_button.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';

import 'package:yoga_app/utils/widgets/app_subheading.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEDEDED),
        body: Container(
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.only(top: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: AppHeading(
                    text: 'Hey!',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: AppSubHeading(
                    text: 'create a new account',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: _emailController,
                  decoration:
                      const InputDecoration(label: Text('Enter your email')),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _passwordController,
                  decoration:
                      const InputDecoration(label: Text('Enter your password')),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _confirmPassword,
                  decoration: const InputDecoration(
                      label: Text('Enter your Confirm password')),
                ),
                const SizedBox(
                  height: 70,
                ),
                appButton(
                  height: 50,
                  text: 'SignUp',
                  borderradius: BorderRadius.circular(0),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      AuthService().registerUser(
                          _emailController.text, _passwordController.text);
                    }
                  },
                ),
                const SizedBox(
                  height: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppSubHeading(
                      text: "Have an account? ",
                    ),
                    InkWell(
                      child: const AppSubHeading(
                        text: ' Login',
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/login2');
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
