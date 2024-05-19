import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoga_app/models/workout_model.dart';
import 'package:yoga_app/pages/workout_detail_page/youtube_player.dart';
import 'package:yoga_app/services/workout_service.dart';
import '../../models/add_course_model.dart';
import '../../services/add_course_service.dart';
import '../../utils/widgets/container_two.dart';

class ExercisePage extends StatefulWidget {
  final String dayName;
  final String courseName;
  final String imageUrl;
  const ExercisePage(
      {super.key,
      required this.courseName,
      required this.dayName,
      required this.imageUrl});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          WorkoutContainerWidget(
            text: widget.courseName,
            imageUrl: widget.imageUrl,
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
                        exercise.courseName == widget.courseName &&
                        exercise.dayName == widget.dayName)
                    .toList();
                List<String?> videoUrls =
                    exercises.map((e) => e.videoUrl).toList();
                return exercises.isEmpty
                    ? const Text('Loading..')
                    : ListView.builder(
                        itemCount: exercises.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                onTap: () {
                                  WorkoutService().saveWorkout(Workout(
                                      workouts: 1,
                                      minutes: 120,
                                      calories: 50,
                                      userId: FirebaseAuth
                                          .instance.currentUser!.uid));
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return VideoPlayerPage(
                                        videosIds: videoUrls,
                                      );
                                    },
                                  ));
                                },
                                leading: Container(
                                  height: 40,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                title: Text(exercises[index].exerciseName),
                                subtitle: Text(exercises[index].exerciseLength),
                              ),
                            ),
                          );
                        },
                      );
              })
        ],
      ),
    );
  }
}
