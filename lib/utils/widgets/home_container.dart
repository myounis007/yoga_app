import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';

class ManHomeContainer extends StatelessWidget {
  final String? text;
  final String imageUrl;
  const ManHomeContainer({super.key, this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: AppHeading(
            size: 18,
            text: text,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
