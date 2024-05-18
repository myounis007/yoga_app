import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:yoga_app/utils/widgets/app_subheading.dart';

class LetsGoPage extends StatelessWidget {
  const LetsGoPage({Key? key}) : super(key: key);

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/bottombarandhome');
          },
          child: const Text("Let's Go"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
