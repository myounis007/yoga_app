import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:yoga_app/utils/widgets/app_button.dart';
import 'package:yoga_app/utils/widgets/app_subheading.dart';

class LetsGoPage extends StatefulWidget {
  const LetsGoPage({super.key});

  @override
  State<LetsGoPage> createState() => _LetsGoPageState();
}

class _LetsGoPageState extends State<LetsGoPage> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 2.h),
              height: 75.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/letsgo.jpeg'),
                ),
              ),
            ),
            const AppSubHeading(
              text:
                  'Doing daily yoga can boost your\n body and mind in just 15 days',
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appButton(
              height: 4.5.h,
              width: 14.h,
              text: "Let's Go",
              onPressed: () {
                Navigator.pushNamed(context, '/ManHome');
              },
            ),
          ],
        ),
      ),
    );
  }
}
