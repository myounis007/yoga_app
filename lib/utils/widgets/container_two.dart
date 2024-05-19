import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';

class WorkoutContainerWidget extends StatelessWidget {
  final String? text;
  final String imageUrl;
  const WorkoutContainerWidget({super.key, this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.w, right: 2.w),
      height: 30.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
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
