import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:yoga_app/utils/widgets/app_button.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';
import 'package:yoga_app/utils/widgets/app_subheading.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEDEDED),
        body: bodycontainer(context),
      ),
    );
  }

  Container bodycontainer(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/bg.jpeg',
              ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.0.h,
            width: 10.h,
            child: const Center(
              child: AppHeading(
                text: 'Yoga',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 59.5.h),
            child: const AppHeading(
              text: 'Lets Move',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          const AppSubHeading(
            text: 'Fitness and Wellness for you\n any time , anywhere',
          ),
          SizedBox(
            height: 2.5.h,
          ),
          appButton(
              height: 5.6.h,
              width: 21.3.h,
              text: 'GET STARTED',
              onPressed: () {
                Navigator.pushNamed(context, '/SignUp3');
              })
        ],
      ),
    );
  }
}
