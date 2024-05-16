import 'package:flutter/material.dart';

class AppHeading extends StatelessWidget {
  final String? text;
  final Color? colors;
  final double size;
  final FontWeight? fontWeight;
  const AppHeading(
      {super.key,
      this.text,
      this.fontWeight,
      this.colors = Colors.black,
      this.size = 28});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: colors,
      ),
    );
  }
}
