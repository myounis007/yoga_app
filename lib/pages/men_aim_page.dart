import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:yoga_app/utils/widgets/app_button.dart';
import 'package:yoga_app/utils/widgets/list_tile_men_aim.dart';

class MenAimPage extends StatefulWidget {
  const MenAimPage({super.key});

  @override
  State<MenAimPage> createState() => _MenAimPageState();
}

class _MenAimPageState extends State<MenAimPage> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 15.h),
        child: Column(
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Whats Your ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 4.5.pt,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Aims?',
                      style: TextStyle(
                          color: const Color(0xffC91471),
                          fontSize: 4.5.pt,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            MensAimPage(
                leadingIcon: Icons.person,
                title: 'Learn Yoga',
                onChanged: (value) {
                  print('$value');
                }),
            SizedBox(
              height: 2.5.h,
            ),
            MensAimPage(
                leadingIcon: Icons.person,
                title: 'Body Shaping ',
                onChanged: (value) {
                  print('$value');
                }),
            SizedBox(
              height: 2.5.h,
            ),
            MensAimPage(
                leadingIcon: Icons.person,
                title: 'Lose Weight',
                onChanged: (value) {
                  print('$value');
                }),
            SizedBox(
              height: 2.5.h,
            ),
            MensAimPage(
                leadingIcon: Icons.person,
                title: 'Sleep Better',
                onChanged: (value) {
                  print('$value');
                }),
            SizedBox(
              height: 2.5.h,
            ),
            MensAimPage(
                leadingIcon: Icons.person,
                title: 'Posture Correction',
                onChanged: (value) {
                  print('$value');
                }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            child: Row(
              children: [
                Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 3.4.h,
                  color: const Color(0xffC8C8C8),
                ),
                const Text(
                  'Previous',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(
                        0xffC8C8C8,
                      )),
                )
              ],
            ),
            onTap: () {},
          ),
          const SizedBox(width: 16),
          appButton(
            height: 45,
            width: 110,
            text: 'Next',
            onPressed: () {
              Navigator.pushNamed(context, '/Username');
            },
          )
        ],
      ),
    ));
  }
}
