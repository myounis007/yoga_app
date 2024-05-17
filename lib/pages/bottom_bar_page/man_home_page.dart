import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/pages/bottom_bar_page/widgets/home_container.dart';
import 'package:yoga_app/utils/widgets/app_appbar.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';

class ManHomePages extends StatefulWidget {
  const ManHomePages({super.key});

  @override
  State<ManHomePages> createState() => _ManHomePagesState();
}

class _ManHomePagesState extends State<ManHomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 4.h),
          child: Column(
            children: [
              const CustomAppBar(),
              SizedBox(
                height: 5.h,
              ),
              const ManHomeContainer(
                text: 'Beginner Yoga \n Plan',
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const ManHomeContainer(
                text: 'Beginner Yoga \n Plan',
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const ManHomeContainer(
                text: 'Beginner Yoga \n Plan',
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    height: 4.h,
                    width: 5.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/male.png'),
                      ),
                    ),
                    child: const AppHeading(
                      text: 'Belly',
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
