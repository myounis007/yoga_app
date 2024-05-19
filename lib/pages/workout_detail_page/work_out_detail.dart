import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/pages/workout_detail_page/exercise_page.dart';
import 'package:yoga_app/services/add_course_service.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';
import 'package:yoga_app/utils/widgets/container_two.dart';

import '../../models/add_course_model.dart';

class WorkOutDetails extends StatefulWidget {
  final String courseName;
  final String iamgeUrl;
  const WorkOutDetails(
      {super.key, required this.courseName, required this.iamgeUrl});

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
                  WorkoutContainerWidget(
                    imageUrl: widget.iamgeUrl,
                    text: widget.courseName,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  FutureBuilder(
                    future: FirebaseService().getExercises(),
                    builder: (BuildContext context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData) {
                        const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('Something went wrong'),
                        );
                      }
                      List<Exercise> exercises = snapshot.data!;

                      exercises = exercises
                          .where((exercise) =>
                              exercise.courseName == widget.courseName)
                          .toList();
                      List<String?> videoUrls =
                          exercises.map((e) => e.videoUrl).toList();
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: exercises.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(2.w),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return ExercisePage(
                                      imageUrl: widget.iamgeUrl,
                                      courseName: exercises[index].courseName,
                                      dayName: exercises[index].dayName,
                                    );
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
                                          AppHeading(
                                            size: 23,
                                            text: exercises[index].dayName,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/flash1.png'),
                                              Image.asset(
                                                  'assets/images/flash2.png'),
                                              Image.asset(
                                                  'assets/images/flash2.png'),
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
                                            exercises[index].kacl,
                                            style:
                                                const TextStyle(fontSize: 18),
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
                                                videoUrls.length.toString(),
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
                                            exercises[index].exerciseLength,
                                            style:
                                                const TextStyle(fontSize: 18),
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
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
