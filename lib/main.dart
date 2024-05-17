import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/pages/lets_go_page.dart';
import 'package:yoga_app/pages/app_gender.dart';
import 'package:yoga_app/pages/auth/login_page.dart';
import 'package:yoga_app/pages/auth/signup_page.dart';
import 'package:yoga_app/pages/bottom_bar_page/man_home_page.dart';
import 'package:yoga_app/pages/men_aim_page.dart';
import 'package:yoga_app/pages/splash_page.dart';
import 'package:yoga_app/pages/user_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        title: 'Yoga App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/login2': (context) => const LoginPage(),
          '/SignUp3': (context) => const SignUpPage(),
          '/Gender': (context) => const GenderSelection(),
          '/ManAim': (context) => const MenAimPage(),
          '/Username': (context) => const UserName(),
          '/LetsGo': (context) => const LetsGoPage(),
          '/ManHome': (context) => const ManHomePage(),
        },
      ),
    );
  }
}
