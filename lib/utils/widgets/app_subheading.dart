import 'package:flutter/material.dart';

class AppSubHeading extends StatelessWidget {
  final String? text;
  final Color? colors;
  final double size;
  const AppSubHeading(
      {super.key, this.text, this.colors = Colors.black, this.size = 18});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text!,
      style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.normal,
          color: colors ?? Colors.blue),
    );
  }
}
