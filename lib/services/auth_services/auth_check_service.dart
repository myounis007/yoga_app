import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/pages/app_gender.dart';
import 'package:yoga_app/pages/splash_page.dart';

class AuthenticationCheckerPage extends StatelessWidget {
  const AuthenticationCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator if authentication state is loading
          return const CircularProgressIndicator();
        }

        if (snapshot.hasData && snapshot.data != null) {
          // User is authenticated, navigate to home screen
          return const GenderSelection();
        } else {
          // User is not authenticated, navigate to login screen
          return const SplashPage();
        }
      },
    );
  }
}
