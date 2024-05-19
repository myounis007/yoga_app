import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/pages/workout_detail_page/work_out_detail.dart';
import 'package:yoga_app/services/add_course_service.dart';
import 'package:yoga_app/utils/widgets/home_container.dart';
import 'package:yoga_app/utils/widgets/app_appbar.dart';
import 'package:yoga_app/utils/widgets/app_heading.dart';

import '../../models/add_course_model.dart';

class HomeAndBottomBar extends StatefulWidget {
  HomeAndBottomBar({super.key});

  @override
  State<HomeAndBottomBar> createState() => _HomeAndBottomBarState();
}

int selectedIndex = 0;

class _HomeAndBottomBarState extends State<HomeAndBottomBar> {
  @override
  void initState() {
    FirebaseService().getExercises();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        margin: EdgeInsets.only(top: 2.h),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FutureBuilder(
                  future: FirebaseService().getExercises(),
                  builder: (BuildContext context, snapshot) {
                    print(snapshot.data);

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (!snapshot.hasData) {
                      const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Something went wrong'),
                      );
                    }

                    List<Exercise> exercises = snapshot.data!;

                    exercises = exercises
                        .where((exercise) =>
                            exercise.gender == "Male" &&
                            exercise.isBodyShaping == false)
                        .toList();

                    return exercises.isEmpty
                        ? Text('Loading..')
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: exercises.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                      borderRadius: BorderRadius.circular(15),
                                      elevation: 5,
                                      child: ManHomeContainer(
                                          imageUrl: exercises[index].imageUrl!,
                                          text: exercises[index].courseName)),
                                ),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return WorkOutDetails(
                                        iamgeUrl: exercises[index].imageUrl!,
                                        courseName: exercises[index].courseName,
                                      );
                                    },
                                  ));
                                },
                              );
                            },
                          );
                  },
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
                      margin: EdgeInsets.all(2.w),
                      height: 18.3.h,
                      child: FutureBuilder(
                          future: FirebaseService().getExercises(),
                          builder: (BuildContext context, snapshot) {
                            print(snapshot.data);

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                    exercise.gender == "Male" &&
                                    exercise.isBodyShaping == true)
                                .toList();
                            return exercises.isEmpty
                                ? Text('Loading..')
                                : GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 1.8),
                                    itemCount: exercises.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return WorkOutDetails(
                                                  iamgeUrl: exercises[index]
                                                      .imageUrl!,
                                                  courseName: exercises[index]
                                                      .courseName,
                                                );
                                              },
                                            ));
                                          },
                                          child: Material(
                                            elevation: 5,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      exercises[index]
                                                          .imageUrl
                                                          .toString()),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: AppHeading(
                                                    size: 20,
                                                    fontWeight: FontWeight.bold,
                                                    text: exercises[index]
                                                        .courseName,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                          })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
