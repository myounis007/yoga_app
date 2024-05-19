import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/pages/profile_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? text;
  final Color? backgroundcolor;
  final IconData? icon;

  final CircleAvatar? avatar;
  final Radius? radius;

  const CustomAppBar({
    super.key,
    this.title,
    this.backgroundcolor,
    this.icon,
    this.avatar,
    this.text,
    this.radius,
  });
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 30,
          child: Text('Logo'),
        ),
      ),
      actions: [
        Row(
          children: [
            const Icon(
              Icons.history,
            ),
            SizedBox(
              width: 3.w,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ProfilePage();
                    },
                  ));
                },
                icon: const Icon(Icons.person))
          ],
        )
      ],
      centerTitle: true,
    );
  }
}
