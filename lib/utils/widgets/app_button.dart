import 'package:flutter/material.dart';

Widget appButton({
  String? text,
  VoidCallback? onPressed,
}) {
  return InkWell(
    child: Container(
      height: 50,
      width: 100,
      color: Colors.amber,
      child: Text(
        text!,
      ),
    ),
    onTap: onPressed,
  );
}
