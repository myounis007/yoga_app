import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/pages/bottom_bar_page/bottom_bar_page.dart';
import 'package:yoga_app/utils/widgets/app_button.dart';

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
            ),
            SizedBox(
              height: 3.h,
            ),
            appButton(
              height: 6.h,
              width: 25.w,
              text: 'Lets Go',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BottomBarPage();
                  },
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
