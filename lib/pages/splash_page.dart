import 'package:flutter/material.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEDEDED),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 160, top: 50),
              height: 100,
              width: 100,
              child: const AppHeading(
                text: 'Yoga',
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 300,
              width: 300,
              child: ClipRRect(child: Image.asset("assets/images/bg.jpeg")),
            )
          ],
        ),
      ),
    );
  }
}
