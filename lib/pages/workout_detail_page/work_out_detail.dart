import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/pages/workout_detail_page/exercise_page.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';
import 'package:yoga_app/utils/widgets/container_two.dart';

class WorkOutDetails extends StatefulWidget {
  const WorkOutDetails({super.key});

  @override
  State<WorkOutDetails> createState() => _WorkOutDetailsState();
}

class _WorkOutDetailsState extends State<WorkOutDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 3.h),
              child: Column(
                children: [
                  const WorkoutContainerWidget(
                    text: 'Beginner Yoga \n Plan',
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const ExercisePage();
                          },
                        ));
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 3.w, right: 3.w),
                        height: 15.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffEDEDED),
                          borderRadius: BorderRadius.all(
                            Radius.circular(1.h),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const AppHeading(
                                    size: 23,
                                    text: 'Day 1',
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('assets/images/flash1.png'),
                                      Image.asset('assets/images/flash2.png'),
                                      Image.asset('assets/images/flash2.png'),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/calories1.png',
                                    height: 4.h,
                                  ),
                                  Text(
                                    '60-70 kcal',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/crossfit1.png',
                                        height: 4.h,
                                      ),
                                      Text(
                                        '5',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/time1.png',
                                    height: 4.h,
                                  ),
                                  Text(
                                    '5 minutes',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Container(
                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                      height: 15.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffEDEDED),
                        borderRadius: BorderRadius.all(
                          Radius.circular(1.h),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AppHeading(
                                  size: 23,
                                  text: 'Day 2',
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/images/flash1.png'),
                                    Image.asset('assets/images/flash2.png'),
                                    Image.asset('assets/images/flash2.png'),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/calories1.png',
                                  height: 4.h,
                                ),
                                Text(
                                  '60-70 kcal',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/crossfit1.png',
                                      height: 4.h,
                                    ),
                                    Text(
                                      '5',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/time1.png',
                                  height: 4.h,
                                ),
                                Text(
                                  '5 minutes',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Container(
                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                      height: 15.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffEDEDED),
                        borderRadius: BorderRadius.all(
                          Radius.circular(1.h),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AppHeading(
                                  size: 23,
                                  text: 'Day 3',
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/images/flash1.png'),
                                    Image.asset('assets/images/flash1.png'),
                                    Image.asset('assets/images/flash2.png'),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/calories1.png',
                                  height: 4.h,
                                ),
                                Text(
                                  '60-70 kcal',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/crossfit1.png',
                                      height: 4.h,
                                    ),
                                    Text(
                                      '5',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/time1.png',
                                  height: 4.h,
                                ),
                                Text(
                                  '5 minutes',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Container(
                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                      height: 15.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffEDEDED),
                        borderRadius: BorderRadius.all(
                          Radius.circular(1.h),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AppHeading(
                                  size: 23,
                                  text: 'Day 4',
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/images/flash1.png'),
                                    Image.asset('assets/images/flash1.png'),
                                    Image.asset('assets/images/flash1.png'),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/calories1.png',
                                  height: 4.h,
                                ),
                                Text(
                                  '60-70 kcal',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/crossfit1.png',
                                      height: 4.h,
                                    ),
                                    Text(
                                      '5',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/time1.png',
                                  height: 4.h,
                                ),
                                Text(
                                  '5 minutes',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Container(
                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                      height: 15.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffEDEDED),
                        borderRadius: BorderRadius.all(
                          Radius.circular(1.h),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AppHeading(
                                  size: 23,
                                  text: 'Day 5',
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/images/flash1.png'),
                                    Image.asset('assets/images/flash1.png'),
                                    Image.asset('assets/images/flash2.png'),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/calories1.png',
                                  height: 4.h,
                                ),
                                Text(
                                  '60-70 kcal',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/crossfit1.png',
                                      height: 4.h,
                                    ),
                                    Text(
                                      '5',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/time1.png',
                                  height: 4.h,
                                ),
                                Text(
                                  '5 minutes',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Container(
                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                      height: 15.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffEDEDED),
                        borderRadius: BorderRadius.all(
                          Radius.circular(1.h),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AppHeading(
                                  size: 23,
                                  text: 'Day 4',
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/images/flash1.png'),
                                    Image.asset('assets/images/flash1.png'),
                                    Image.asset('assets/images/flash1.png'),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/calories1.png',
                                  height: 4.h,
                                ),
                                Text(
                                  '60-70 kcal',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/crossfit1.png',
                                      height: 4.h,
                                    ),
                                    Text(
                                      '5',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/time1.png',
                                  height: 4.h,
                                ),
                                Text(
                                  '5 minutes',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
