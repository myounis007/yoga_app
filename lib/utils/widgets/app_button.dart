import 'package:flutter/material.dart';

Widget appButton({
  String? text,
  VoidCallback? onPressed,
  double? height,
  double? width,
  BorderRadiusGeometry? borderradius,
}) {
  return InkWell(
    // ignore: sort_child_properties_last
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: const Color(0xffE79EB6),
          borderRadius: borderradius ?? BorderRadius.circular(30)),
      child: Center(
        child: Text(
          text!,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    ),
    onTap: onPressed,
  );
}
