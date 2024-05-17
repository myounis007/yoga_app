import 'package:flutter/material.dart';
import 'package:yoga_app/utils/widgets/app_appbar.dart';

class ManHomePage extends StatelessWidget {
  const ManHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}
