import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/services/auth_services/auth_account_service.dart';
import 'package:yoga_app/utils/widgets/app_button.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';

import 'package:yoga_app/utils/widgets/app_subheading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEDEDED),
        body: Container(
          padding: EdgeInsets.all(1.8.h),
          margin: EdgeInsets.only(top: 5.h),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: AppHeading(
                      text: 'Welcome',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: AppSubHeading(
                      text: 'Sign in to Continue',
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration:
                        const InputDecoration(label: Text('Enter your email')),
                  ),
                  SizedBox(
                    height: 2.7.h,
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        label: Text('Enter your password')),
                  ),
                  SizedBox(
                    height: 1.8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: const AppSubHeading(
                          text: 'Forgot Password?',
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  appButton(
                      height: 5.h,
                      text: 'Login',
                      borderradius: BorderRadius.circular(0.h),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          AuthService()
                              .login(_emailController.text,
                                  _passwordController.text)
                              .then(
                            (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Login successfull')));

                              Navigator.pushNamed(context, '/Gender');
                            },
                          );
                          ;
                        }
                      }),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppSubHeading(
                        text: "Don't have an account? ",
                      ),
                      InkWell(
                        child: const AppSubHeading(
                          text: ' SignUp',
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/SignUp');
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
