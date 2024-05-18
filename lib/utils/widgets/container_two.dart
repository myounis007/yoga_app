import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';

class WorkoutContainerWidget extends StatelessWidget {
  final String? text;
  const WorkoutContainerWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.w, right: 2.w),
      height: 30.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/female.png'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: AppHeading(
            size: 20,
            text: text,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
