// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class AuthenticationCheckerPage extends StatelessWidget {
//   const AuthenticationCheckerPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Show loading indicator if authentication state is loading
//           return const CircularProgressIndicator();
//         }

//         if (snapshot.hasData && snapshot.data != null) {
//           // User is authenticated, navigate to home screen
//         //  return CoursesScreen();
//         } else {
//           // User is not authenticated, navigate to login screen
//          // return const LoginPage();
//         }
//       },
//     );
//   }
// }
