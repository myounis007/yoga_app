import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundcolor;

  const CustomAppBar({super.key, this.title, this.backgroundcolor});
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!),
      backgroundColor: backgroundcolor,
      centerTitle: true,
    );
  }
}
