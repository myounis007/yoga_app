import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String? text;
  final Color? colors;
  final double size;
  const SmallText(
      {super.key, this.text, this.colors = Colors.black, this.size = 10});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontSize: size, fontWeight: FontWeight.normal, color: colors),
    );
  }
}
