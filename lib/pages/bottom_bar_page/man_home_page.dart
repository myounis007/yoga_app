import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/utils/widgets/home_container.dart';
import 'package:yoga_app/utils/widgets/app_appbar.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';

class HomeAndBottomBar extends StatefulWidget {
  const HomeAndBottomBar({super.key});

  @override
  State<HomeAndBottomBar> createState() => _HomeAndBottomBarState();
}

int selectedIndex = 0;

class _HomeAndBottomBarState extends State<HomeAndBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                child: const ManHomeContainer(text: 'Beginner Yoga \nPlan 1'),
                onTap: () {
                  Navigator.pushNamed(context, '/workout');
                },
              ),
              const SizedBox(height: 16.0),
              const ManHomeContainer(text: 'Beginner Yoga \nPlan 2'),
              const SizedBox(height: 16.0),
              const ManHomeContainer(text: 'Beginner Yoga\n Plan 3'),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 2.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 2.w),
                child: const AppHeading(
                  text: 'Body Focus',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 2.w, right: 2.w),
                  height: 18.3.h,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/male.png'),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 27.w),
                          child: const AppHeading(
                            text: 'Belly',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              'assets/images/Home.png',
              width: 5.h,
              height: 5.h,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              'assets/images/Workout1.png',
              width: 6.h,
              height: 6.h,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              'assets/images/Statistics.png',
              width: 5.h,
              height: 5.h,
            ),
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
