import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';

class ManHomeContainer extends StatelessWidget {
  final String? text;
  const ManHomeContainer({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.amber,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/Maskgroup.png'),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 7.h, left: 3.w),
        child: AppHeading(
          size: 18,
          text: text,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
